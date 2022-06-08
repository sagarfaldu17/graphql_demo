import 'package:graphql/client.dart';
import 'package:graphql_demo/service/graphql_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/character_response_model.dart';
import 'base/auth_service.dart';

class GraphqlAuthService implements AuthService {

  final String userIdKey = "userId";
  final String userTokenKey = "userToken";
  final String profileTokenKey = "profileToken";

  String? currentUserToken;
  String? currentProfileToken;
  String? currentUserId;

  GraphQLClient? getClient() {
    GraphqlService graphqlService = GraphqlService();
    graphqlService.init();
    return graphqlService.client;
  }

  @override
  Future<List<CharacterModel>?> getCharacterList() async {
    // final prefs = await SharedPreferences.getInstance();
    // String? profileToken = prefs.getString('profileToken');
    GraphQLClient? client = getClient();
    if (client != null) {

        String queryStr = r'''
       query {
          characters(page: 1) {
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
          List<dynamic> characterListModel = data?['characters']['results'];
          List<CharacterModel>? finalCharacterListModel = [];

          for (var eachElement in characterListModel) {
            var characterModel = CharacterModel(id: eachElement['id'], name: eachElement['name'], status: eachElement['status']);
            finalCharacterListModel.add(characterModel);
          }

          return finalCharacterListModel;
        } else {
          print('graphqlErrors: ${result.exception?.graphqlErrors[0]}');
          // String errorCode = GraphqlService.getErrorCode(result);
          // if (errorCode == 'LS050') {
          //   //User don't have any transaction yet.
          //   return [];
          // } else {
          //   throw errorCode;
          // }
        }
    }
    throw UnimplementedError();
  }
}
