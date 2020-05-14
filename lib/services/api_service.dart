import 'package:bebetter/keys/server_keys.dart';
import 'package:hasura_connect/hasura_connect.dart';

class ApiService {

  HasuraConnect connect = HasuraConnect(ServerKeys().hasuraEndpoint);

  Future<dynamic> query(query, variables) async {
    connect.addHeader(ServerKeys().headerKey, ServerKeys().adminSecret);
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
    connect.addHeader(ServerKeys().headerKey, ServerKeys().adminSecret);
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
    connect.addHeader(ServerKeys().headerKey, ServerKeys().adminSecret);
    variables = variables != null ? variables : <String, dynamic>{};
    try {
      return connect.subscription(query, variables: variables, key: key);
    } on HasuraError catch (err) {
      print("Hasura Subscription error ${err.message}");
      return null;
    }
  }
}
