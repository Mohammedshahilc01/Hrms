import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hrm/Controller/GlobalVariable/GlobalVariable.dart';

class ApiServices {
  Future<void> userLogin() async {
    print('openData');
    print('openData');
    print('openData');
    HttpLink link = HttpLink('http://192.168.0.190:8000/graphql/');
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    String email = "mohammedshahil.c@keelis.com";
    String password = "Shahil@123";
    final updateUserMutation = gql('''
    mutation Login(\$email: String!, \$password: String!) {
    tokenAuth(email: \$email, password:\$password) {
        success
        errors
        token
        refreshToken
        user {
            id
            email
            username
            firstName
            lastName
            teamleader
            empid
            role
            department
            designation
            address
            login
            logout
            isActive
        }
    }

}
''');
//     String createUserMutation ="""
//     mutation Login($email: String!, $password: String!) {
//     tokenAuth(email: $email, password: $password) {
//         success
//         errors
//         token
//         refreshToken
//         user {
//             id
//             email
//             username
//             firstName
//             lastName
//             teamleader
//             empid
//             role
//             department
//             designation
//             address
//             login
//             logout
//             isActive
//         }
//     }
// }""";
    final result = await qlClient.mutate(
   MutationOptions(
     document:gql('''
    mutation Login(\$email: String!, \$password: String!) {
    tokenAuth(email: \$email, password: \$password) {
        success
        errors
        token
        refreshToken
        user {
            id
            email
            username
            firstName
            lastName
            teamleader
            empid
            role
            department
            designation
            address
            login
            logout
            isActive
        }
    }

}
'''),
     onError: (data){
       print('-----------------------------------------');
       print(data);
       print('-----------------------------------------');
     },
     variables: const {
       "email":"mohammedshahil.c@keelis.com",
       "password":"Shahil@123"
     }
   )
    );

    // QueryResult queryResult = await qlClient.mutate(
    //   MutationOptions(
    //       document: gql(
    //         createUserMutation,
    //       ),
    //       variables: {
    //         "email":"mohammedshahil.c@keelis.com",
    //         "password":"Shahil@123"
    //       }),
    // );
    print("queryResult.data");
    print(result.data);
    print("queryResult.data");
  }
}
