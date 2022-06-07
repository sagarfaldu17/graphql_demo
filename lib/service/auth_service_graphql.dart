import 'package:graphql/client.dart';
import 'package:graphql_demo/service/graphql_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base/auth_service.dart';
import '../model/character_model.dart';

class GraphqlAuthService implements AuthService {

  final String userIdKey = "userId";
  final String userTokenKey = "userToken";
  final String profileTokenKey = "profileToken";

  String? currentUserToken;
  String? currentProfileToken;
  String? currentUserId;

  GraphQLClient? getClient([String? token]) {
    GraphqlService graphqlService = GraphqlService();
    graphqlService.init(token: token);
    return graphqlService.client;
  }

  @override
  Future<List<CharacterModel>?> getCharacterList() async {
    final prefs = await SharedPreferences.getInstance();
    String? profileToken = prefs.getString('profileToken');
    GraphQLClient? client = getClient(profileToken);
    if (client != null) {

        String queryStr = '''
       query {
          characters(page: 2) {
             results {
                id
                name
                status
              }
          }
        }
            ''';

        MutationOptions options = MutationOptions(
          document: gql(queryStr),
        );

        QueryResult result = await client.mutate(options);
        if (!result.hasException) {
          Map<String, dynamic>? data = result.data;
          if (data != null) {

            List<dynamic>? listOfLedgerBalancePointsHistoryMap = data['pointsHistory'];
            print('listOfLedgerBalancePointsHistoryMap: $listOfLedgerBalancePointsHistoryMap');
            List<LedgerBalancePointsHistory> finalListOfLedgerBalancePointsHistoryModels = [];

            if (listOfLedgerBalancePointsHistoryMap != null) {
              for (var eachMapElement in listOfLedgerBalancePointsHistoryMap) {

                String? dateAdded = DateFormat.yMd().format(DateTime.parse(eachMapElement['dateAdded'] ?? "${DateTime.now().toUtc().toString()}"));
                String? finalPoints = '';
                String? storeName = '';
                double? points = eachMapElement['point'];

                if (eachMapElement['pointClassification'] == 'DEPOSIT') {
                  finalPoints = '$points';
                  storeName = eachMapElement['storeName'] ?? 'Evaluation Deposit';
                } else {
                  finalPoints = '- $points';
                  storeName = eachMapElement['storeName'] ?? 'Store Withdrawal';
                }
                var ledgerBalancePointsHistoryModel = LedgerBalancePointsHistory(id: eachMapElement['id'], challengeId: eachMapElement['challengeId'],
                    dateAdded: dateAdded, point: finalPoints,
                    pointClassification: eachMapElement['pointClassification'], profileId: eachMapElement['profileId'],
                    storeName: storeName, video: eachMapElement['video']);

                finalListOfLedgerBalancePointsHistoryModels.add(ledgerBalancePointsHistoryModel);
              }
            }

            return finalListOfLedgerBalancePointsHistoryModels;
          }
        } else {
          String errorCode = GraphqlService.getErrorCode(result);
          if (errorCode == 'LS050') {
            //User don't have any transaction yet.
            return [];
          } else {
            throw errorCode;
          }
        }
    }
    throw UnimplementedError();
  }
}
