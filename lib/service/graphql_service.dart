import 'package:graphql/client.dart';

import '../env.dart';

class GraphqlService {
  final String devBaseUrl = 'https://rickandmortyapi.com/graphql/';
  final String prodBaseUrl =
      'https://rickandmortyapi.com/graphql/';

  final String _baseUrl =
      env?.baseUrl ?? 'https://rickandmortyapi.com/graphql/';
  late GraphQLClient client;

  void init() {
    HttpLink httpLink = HttpLink(
      _baseUrl,
      //defaultHeaders: token != null ? {'Authorization': 'Bearer $token'} : {},
    );

    // AuthLink authLink = AuthLink(
    //   getToken: () async => 'Bearer $token',
    // );

    // Link link = authLink.concat(httpLink);

    // client = GraphQLClient(
    //   /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    //   cache: InMemoryCache(),
    //   link: token != null ? link : httpLink,
    // );

    client = GraphQLClient(
      /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(),
      link: httpLink,
    );
  }

  // static String getErrorCode(
  //   QueryResult result, {
  //   bool showUnauthorizedError = true,
  // }) {
  //   String resutErrorCode = '';
  //
  //   OperationException? exception = result.exception;
  //
  //   if (exception != null) {
  //     LinkException? linkException = exception.linkException;
  //
  //     if (linkException != null) {
  //       if (linkException is ServerException) {
  //         Response? parsedResponse = linkException.parsedResponse;
  //         if (parsedResponse != null) {
  //           List<GraphQLError>? errors = parsedResponse.errors;
  //           if (errors != null && errors.isNotEmpty) {
  //             String? errorMessage = errors[0].message;
  //             print("Graphql Error: $errorMessage");
  //             Map<String, dynamic>? errorExtensions = errors[0].extensions;
  //             if (errorExtensions != null && errorExtensions.isNotEmpty) {
  //               String? errorCode = errorExtensions['code'];
  //               if (errorCode != null) {
  //                 resutErrorCode = errorCode;
  //               }
  //             }
  //           }
  //         }
  //       }
  //     }
  //   }
  //   String val = showUnauthorizedError
  //       ? handleUnauthorizedRequests(resutErrorCode)
  //       : resutErrorCode;
  //   return val;
  // }
  //
  // static String handleUnauthorizedRequests(String errorCode) {
  //   if (errorCode == 'AUTH_NOT_AUTHENTICATED' ||
  //       errorCode == 'AUTH_NOT_AUTHORIZED') {
  //     OneContext.instance.showModalBottomSheet(
  //       builder: (context) {
  //         return Container(
  //           height: 350.0,
  //           color: Colors.transparent,
  //           child:  Container(
  //               decoration:  const BoxDecoration(
  //                   color: Color(0xffE12F01),
  //                   borderRadius: BorderRadius.only(
  //                       topLeft:  Radius.circular(25.0),
  //                       topRight:  Radius.circular(25.0))),
  //               child: Padding(
  //                 padding: const EdgeInsets.all(35.0),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Row(
  //                           children: [
  //                             Icon(Icons.error_outline, color: Colors.white),
  //                             horizontalSpaceXSmall(context),
  //                             Expanded(
  //                                 child: Text(
  //                               S.of(context).theFollowingErrorOccurred,
  //                               maxLines: 2,
  //                               style: GoogleFonts.roboto(
  //                                 fontWeight: FontWeight.w700,
  //                                 color: Colors.white,
  //                                 fontSize: McGyver.textSize(context, 2.9),
  //                               ),
  //                             ))
  //                           ],
  //                         ),
  //                         verticalSpaceSmall(context),
  //                         SizedBox(
  //                           height: 350 / 2.3,
  //                           child: SingleChildScrollView(
  //                             child: Text(S.of(context).sessionExpired,
  //                                 style: GoogleFonts.roboto(
  //                                   fontWeight: FontWeight.w400,
  //                                   color: Colors.white,
  //                                   fontSize: McGyver.textSize(context, 2.2),
  //                                 )),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     Row(
  //                       children: [
  //                         Expanded(
  //                           child: RoundedButton(
  //                             filled: false,
  //                             backgroundColor: Colors.transparent,
  //                             onPressed: () {
  //                               Navigator.of(context).pop();
  //                               Navigator.push(
  //                                   context,
  //                                   MaterialPageRoute(
  //                                       builder: (context) => CustomAppWebview(
  //                                             url: S.of(context).moreInfoURL1,
  //                                           )));
  //                             },
  //                             text: S.of(context).moreInfo,
  //                             radius: 100,
  //                             borderColor: Colors.white,
  //                             letterSpacing: 1.0,
  //                             textColor: Colors.white,
  //                           ),
  //                         ),
  //                         horizontalSpaceXSmall(context),
  //                         Expanded(
  //                           child: RoundedButton(
  //                             filled: true,
  //                             onPressed: () {
  //                               Navigator.pop(context);
  //                             },
  //                             backgroundColor: Color(0xffF9B134),
  //                             text: S.of(context).ok.toUpperCase(),
  //                             radius: 100,
  //                             letterSpacing: 1.0,
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               )),
  //         );
  //       },
  //       isDismissible: false,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
  //       ),
  //     );
  //     OneContext.instance.showSnackBar(
  //         builder: (context) =>
  //             SnackBar(content: Text(S.of(context!).sessionExpired)));
  //     OneContext.instance.pushReplacementNamed(Routes.LOGIN_PAGE);
  //     return 'goToLogin';
  //   } else {
  //     return errorCode;
  //   }
  // }
}
