String updateUserMutation = """

""";

String createUserByAccessKeyMutation = """
mutation createUserByAccessKey(\$access_key: String!) {
  insert_user(objects: {access_key: \$access_key}) {
    affected_rows
    returning {
      user_id
    }
  }
}
""";