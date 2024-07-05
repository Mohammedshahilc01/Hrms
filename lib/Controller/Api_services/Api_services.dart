
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hrm/Controller/Api_services/Components/Url_list.dart';
import 'package:hrm/Controller/GlobalVariable/GlobalVariable.dart';
import 'Components/Mutation_string.dart';
import 'Components/Query_string.dart';

class ApiServices {
  
  Future userLogin(String emailId,String password) async {
    print('------------------------------------');
    print(emailId);
    print(password);
    print('------------------------------------');
    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    final result = await qlClient.mutate(MutationOptions(
        document: gql(MutationString.loginMutation),
        onError: (data) {
          FlutterToast.print(data.toString());
        },
        variables: {
          "email": emailId,
          "password": password
        }));
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
        return result.data;
      }
    }
  }
  
  
  Future userLogout(String? id) async {
    
    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
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

  Future userAddLeaveMutation(String? userId, String? teamLeader, String? typeOfLeave, String? causeOfLeave, String fromDate, String toDate, String requestDate) async {

    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    final result = await qlClient.mutate(MutationOptions(
        document: gql(MutationString.addLeaveMutation),
        onError: (data) {
          FlutterToast.print(data.toString());
        },
        variables: {
          "userId": userId,
          "teamleaderId": teamLeader,
          "requestedOn": requestDate,
          "leaveType": typeOfLeave,
          "leaveFrom": fromDate,
          "leaveTill": toDate,
          "halfDay": "",
          "reason": causeOfLeave
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



  Future userLeaveRequestQuery(String? id) async {

    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    final result = await qlClient.mutate(MutationOptions(
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

    HttpLink link = HttpLink(BaseUrl.baseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    final result = await qlClient.mutate(MutationOptions(
        document: gql(QueryString.userCheckInTestQuery),
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
