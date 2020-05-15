import 'package:bebetter/keys/server_keys.dart';
import 'package:hasura_connect/hasura_connect.dart';

class ApiService {
  ApiService._init();
  HasuraConnect connect =
      HasuraConnect("https://bebetter.herokuapp.com/v1/graphql");

  Future<dynamic> query(query, variables) async {
    connect.addHeader(serverKeys.headerKey, serverKeys.adminSecret);
    variables = variables != null ? variables : <String, dynamic>{};
    var result = {};
    try {
      result = await connect.query(query, variables: variables);
    } on HasuraError catch (err) {
      print("Hasura query error: ${err.message}");
    }
    return result['data'];
  }

  Future<dynamic> mutation(query, variables) async {
    connect.addHeader(serverKeys.headerKey, serverKeys.adminSecret);

    variables = variables != null ? variables : <String, dynamic>{};
    var result = {};
    try {
      result = await connect.mutation(query, variables: variables);
    } on HasuraError catch (err) {
      print("Hasura mutation error: ${err.message}");
    }
    return result['data'];
  }

  Snapshot subscribe(query, variables, key) {
    connect.addHeader(serverKeys.headerKey, serverKeys.adminSecret);
    variables = variables != null ? variables : <String, dynamic>{};
    try {
      return connect.subscription(query, variables: variables, key: key);
    } on HasuraError catch (err) {
      print("Hasura Subscription error ${err.message}");
      return null;
    }
  }
}
ApiService apiService = ApiService._init();
