String getUserByIdQuery = """
query getUserByIdQuery(\$access_key: String! ) {
  user(where: {access_key: {_eq: \$access_key}}) {
    user_id
    access_key
  }
}
""";