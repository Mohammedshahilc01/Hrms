import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// void main() async {
//   await initHiveForFlutter();
//   runApp(MyApp());
// }

class TestData extends StatelessWidget {
  const TestData({super.key});

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
      'https://your-graphql-endpoint.com/graphql',
    );

    // final AuthLink authLink = AuthLink(
    //   getToken: () async => 'Bearer <YOUR_AUTH_TOKEN>',
    // );

    final Link link = httpLink;

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: HiveStore()),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('GraphQL Example')),
          body: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String query = """
  query {
    yourQuery {
      field1
      field2
    }
  }
  """;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(query),
      ),
      builder: (QueryResult result, { VoidCallback? refetch, FetchMore? fetchMore }) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return CircularProgressIndicator();
        }

        final data = result.data;
        if (data == null) {
          return Text('Response is null');
        }

        return Text('Response: ${data['yourQuery']['field1']}');
      },
    );
  }
}
