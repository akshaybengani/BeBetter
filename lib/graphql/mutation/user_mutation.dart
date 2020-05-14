String updateUserMutation = """
mutation MyMutation(\$access_key: String!) {
  insert_user(objects: {access_key: \$access_key}) {
    affected_rows
  }
}
""";