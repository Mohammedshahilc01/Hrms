
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hrm/Controller/Api_services/Components/Url_list.dart';
import 'package:hrm/Controller/GlobalVariable/GlobalVariable.dart';
import 'Components/Mutation_string.dart';

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
}
