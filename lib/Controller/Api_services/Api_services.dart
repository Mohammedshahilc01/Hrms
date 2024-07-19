import 'package:graphql_flutter/graphql_flutter.dart';
import '../GlobalVariable/GlobalVariable.dart';
import 'Components/Mutation_string.dart';
import 'Components/Query_string.dart';
import 'Components/Url_list.dart';


class ApiServicesMutation {
  Future userLogin(String emailId,String password) async {
    print('------------------------------------');
    print(emailId);
    print(password);
    print('------------------------------------');
    HttpLink link = HttpLink(BaseUrl.baseUrl);
    print("link");
    print(link.uri);
    print("link");
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    final result = await qlClient.mutate(MutationOptions(
        document: gql(MutationString.loginMutation),
        onError: (data) {
          print('----------------------------');
          print(data);
          print('----------------------------');
          FlutterToast.print(data.toString());
        },
        variables: {
          "email": emailId,
          "password": password
        }));
        print("result.source");
        print(result.source);
        print("result.source");
    if (result.hasException) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        FlutterToast.print("GraphQL Error");
      }
      if (result.exception!.linkException != null) {
        FlutterToast.print("Network Error");
      }
    } else if (result.data != null) {
      var token = result.data!['tokenAuth']['token'];
      if (token == null) {
        FlutterToast.print('Invalid credentials');
      } else {
        print('------------userLogin------------------');
        print(result.data);
        print('------------userLogin------------------');
        return result.data;
      }
    }
  }

  Future userLogout(String? id) async {
    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
      ),
    );
    final result = await qlClient.mutate(MutationOptions(
        document: gql(MutationString.logoutMutation),
        onError: (data) {
          FlutterToast.print(data.toString());
        },
        variables: {
          "id": id,
        }));
    if (result.hasException) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        FlutterToast.print("GraphQL Error");
      }
      if (result.exception!.linkException != null) {
        FlutterToast.print("Network Error");
      }
    }
    return result.data;
  }

  Future userAddLeaveMutation(Map<String, dynamic> variables, String? id, String? teamLeader, String? typeOfLeave, String? causeOfLeave, String from, String toDate, String requestDate,) async {
      print(id);
      print(teamLeader);
      print(requestDate);
      print(typeOfLeave);
      print(causeOfLeave);
      print(from);
      print(toDate);
    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
      ),
    );
    final result = await qlClient.mutate(MutationOptions(
        document: gql(MutationString.addLeaveMutation),
        onError: (data) {
          FlutterToast.print(data.toString());
        },
        fetchPolicy: FetchPolicy.noCache,
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        variables: {
          "userId":"$id",
          "teamLeaderId": "$teamLeader",
          "requestedOn": "${requestDate}",
          "leaveType": "${typeOfLeave}",
          "reason": "${causeOfLeave}",
          "leaveFrom": "${from}",
          "leaveTill": "${toDate}",
          "halfDay": ""
        }));
    // if (result.hasException) {
    //   if (result.exception!.graphqlErrors.isNotEmpty) {
    //     FlutterToast.print("GraphQL Error");
    //   }
    //   if (result.exception!.linkException != null) {
    //     FlutterToast.print("Network Error");
    //   }
    // }
    print('userAddLeaveMutation');
    print(result.data);
    print('userAddLeaveMutation');
    return result.data;
  }

  Future userCheckInLogin(String? id) async {
    print('------------------------------------');
    print(id);
    print('------------------------------------');
    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    final result = await qlClient.mutate(MutationOptions(
        document: gql(MutationString.checkInLoginMutation),
        onError: (data) {
          print('----------------------------');
          print(data);
          print('----------------------------');
          FlutterToast.print('NetWork Error');
        },
        variables: {
          "id": id,
        }));
    if (result.hasException) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        FlutterToast.print("GraphQL Error");
      }
      if (result.exception!.linkException != null) {
        FlutterToast.print("Network Error");
      }
    } else {
      print('------------result.data------------');
      print(result.data);
      print('------------result.data------------');
      return result.data;
    }
  }

  Future userCheckInMutation(String? id) async {
    print('------------------------------------');
    print(id);
    print('------------------------------------');
    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    final result = await qlClient.mutate(MutationOptions(
        document: gql(MutationString.checkInMutation),
        onError: (data) {
          print('----------------------------');
          print(data);
          print('----------------------------');
          FlutterToast.print(data.toString());
        },
        variables: {
          "id": id,
        }));
    if (result.hasException) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        FlutterToast.print("GraphQL Error");
      }
      if (result.exception!.linkException != null) {
        FlutterToast.print("Network Error");
      }
    } else {
      print('------------result.data------------');
      print(result.data);
      print('------------result.data------------');
      return result.data;
    }
  }

  Future userCheckOutLogOut(String? id) async {

    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    final result = await qlClient.mutate(MutationOptions(
        document: gql(MutationString.checkOutLogOutMutation),
        onError: (data) {
          print('----------------------------');
          print(data);
          print('----------------------------');
          FlutterToast.print('NetWork Error');
        },
        variables: {
          "id": id,
        }));
    if (result.hasException) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        FlutterToast.print("GraphQL Error");
      }
      if (result.exception!.linkException != null) {
        FlutterToast.print("Network Error");
      }
    } else {
      print('------------result.data userCheckOutLogOut------------');
      print(result.data);
      print('------------result.data userCheckOutLogOut------------');
      return result.data;
    }
  }

  Future userCheckOutMutation(String? id) async {
    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
      ),
    );
    final result = await qlClient.mutate(MutationOptions(
        document: gql(MutationString.checkOutmutation),
        onError: (data) {
          FlutterToast.print(data.toString());
        },
        variables: {
          "id": id,
        }));
    if (result.hasException) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        FlutterToast.print("GraphQL Error");
      }
      if (result.exception!.linkException != null) {
        FlutterToast.print("Network Error");
      }
    }
    return result.data;
  }


}

class ApiServicesQuery {

  Future userLeaveRequestQuery(String? id) async {
    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    final result = await qlClient.query(QueryOptions(
        document: gql(QueryString.userLeaveRequestQuery),
        onError: (data) {
          FlutterToast.print(data.toString());
        },
        variables: {
          "id": id,
        }));
    if (result.hasException) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        FlutterToast.print("GraphQL Error");
      }
      if (result.exception!.linkException != null) {
        FlutterToast.print("Network Error");
      }
    }
    return result.data;
  }

  Future userCheckInTestQuery(String? id) async {
    print('UserId');
    print(id);
    print('UserId');
    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );
    final result = await qlClient.query(QueryOptions(
      document: gql(QueryString.userCheckInTestQuery),
        fetchPolicy: FetchPolicy.noCache,
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
          variables: {
            "id": id,
          }
    ));
    // final result = await qlClient.mutate(MutationOptions(
    //     document: gql(QueryString.userCheckInTestQuery),
    //     onError: (data) {
    //       FlutterToast.print(data.toString());
    //     },
    //     fetchPolicy: FetchPolicy.noCache,
    //     cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
    //     variables: {
    //       "id": id,
    //     }));
    if (result.hasException) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        FlutterToast.print("GraphQL Error");
      }
      if (result.exception!.linkException != null) {
        FlutterToast.print("Network Error");
      }
    }
    print('result.data');
    print(result.data);
    print('result.data');
    return result.data;
  }

  Future getUserDetailQuery(String? id) async {
    print('UserId');
    print(id);
    print('UserId');
    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );
    final result = await qlClient.query(QueryOptions(
        document: gql(QueryString.getUserDetail),
        fetchPolicy: FetchPolicy.noCache,
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        variables: {
          "Id": id,
        }
    ));
    if (result.hasException) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        FlutterToast.print("GraphQL Error");
      }
      if (result.exception!.linkException != null) {
        FlutterToast.print("Network Error");
      }
    }
    print('result.data');
    print(result.data);
    print('result.data');
    return result.data;
  }

  Future getUserLeaveDetailsQuery(String? id) async {
    print('--------id0--------------');
    print(id);
    print('--------id0--------------');
    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    final result = await qlClient.query(QueryOptions(
        document: gql(QueryString.userLeaveDetailsUserQuery),
        fetchPolicy: FetchPolicy.noCache,
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        variables: {
          "id": id,
        }
    ));
    if (result.hasException) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        FlutterToast.print("GraphQL Error");
      }
      if (result.exception!.linkException != null) {
        FlutterToast.print("Network Error");
      }
    }
    print('getUserLeaveDetailsQuery result.data');
    print(result.data);
    print('getUserLeaveDetailsQuery result.data');
    return result.data;
  }

  Future getUserAttendanceDetailsQuery(String? id) async {
    print('--------id0--------------');
    print(id);
    print('--------id0--------------');
    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    final result = await qlClient.query(QueryOptions(
        document: gql(QueryString.userAttendanceDetailsQuery),
        fetchPolicy: FetchPolicy.noCache,
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        variables: {
          "id": id,
        }
    ));
    if (result.hasException) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        FlutterToast.print("GraphQL Error");
      }
      if (result.exception!.linkException != null) {
        FlutterToast.print("Network Error");
      }
    }
    print('getUserAttendanceDetailsQuery result.data');
    print(result.data);
    print('getUserAttendanceDetailsQuery result.data');
    return result.data;
  }
}
