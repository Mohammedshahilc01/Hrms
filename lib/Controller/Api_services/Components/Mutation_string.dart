import 'package:flutter/material.dart';

class MutationString{
  static String loginMutation = """
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
  """;
}