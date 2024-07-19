import 'package:flutter/material.dart';

class MutationString {
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

  static String logoutMutation = """
  mutation Logout(\$id: String!) {
    logout(id: \$id) {
      set
    }
  }
""";
  static String addLeaveMutation = """
  mutation requestForLeave(\$userId: String!, \$teamLeaderId: String!, \$requestedOn: Date!, \$leaveType: String!, \$leaveFrom: String!, \$leaveTill: String!, \$halfDay: String!, \$reason: String!) {
    addleaveApproval(input: {
      userId: \$userId,
      teamleaderId: \$teamLeaderId,
      requestedOn: \$requestedOn,
      leaveType: \$leaveType,
      leaveFrom: \$leaveFrom,
      leaveTill: \$leaveTill,
      halfDay: \$halfDay,
      reason: \$reason
    }) {
      leaveApproval {
        teamleaderId
        requestedOn
        leaveType
        leaveFrom
        leaveTill
        totalDays
        halfDay
        reason
      }
    }
  }
  """;
  // static String checkInmutation = """
  //   mutation checkin(\$id: String!) {
  //     checkInUpdate(id: \$id) {
  //       set
  //       checkin {
  //         id
  //         user {
  //           id
  //         }
  //       }
  //     }
  //   }
  // """;


  static String checkInLoginMutation = """
  mutation Login(\$id: String!) {
    login(id: \$id) {
      set
    }
  }
  """;

  static String checkInMutation = '''
  mutation checkin(\$id:String!){
    checkInUpdate(id:\$id){
      set
      checkin{
        id
        user{
          id
        }
      }
    }
  }
''';

  static String checkOutLogOutMutation = """
  mutation Logout(\$id: String!) {
    Logout(id: \$id) {
      set
    }
  }
  """;

  static String checkOutmutation = """
    mutation checkOut(\$id: String!) {
      checkOut(id: \$id) {
        set
        checkout {
          id
          user {
            id
          }
        }
      }
    }
  """;

}
