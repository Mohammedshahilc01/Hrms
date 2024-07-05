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
}
