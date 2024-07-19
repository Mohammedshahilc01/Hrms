class QueryString {
  static String userLeaveRequestQuery = '''
      query userLeaveRequest(\$id: String!) {
        leaveRequestsByMe(id: \$id) {
          id
          requestedOn
          leaveType
          leaveFrom
          leaveTill
          totalDays
          halfDay
          reason
          status
          lastUpdate
          teamApproval
          teamleaderId
        }
      }
    ''';
  static String userCheckInTestQuery = '''
      query userAttenance(\$id:String!){
  todayUserAttendanceDetails(id:\$id){
    checkIn
    checkOut
    totalWorkingHours
    lastUpdate
  }
} ''';

  static String getUserDetail = '''
      query getUserDetail(\$Id: String!) {
    userDetail(Id: \$Id) {
      id
      password
      lastLogin
      isSuperuser
      username
      firstName
      lastName
      isStaff
      isActive
      dateJoined
      email
      address
      contactno
      dob
      location
      gender
      login
      logout
      role
      lastUpdate
      department
      designation
      empid
      attendanceId
      teamleader
    }
  }''';

  static String userLeaveDetailsUserQuery = '''
      query leaveDetailsUser(\$id:String!){
      leaveConfigurationByMe(id:\$id){
    id
    casualLeave
    sickLeave
    earnedLeave
    restrictedLeave
    user{
      id
      username
    }
  }
}
''';

  static String userAttendanceDetailsQuery = '''
     query userattanace(\$id:String!){
  userAttendanceDetails(id:\$id){
    id
    checkIn
    checkOut
    totalWorkingHours
    lastUpdate
  }
}
''';
}
