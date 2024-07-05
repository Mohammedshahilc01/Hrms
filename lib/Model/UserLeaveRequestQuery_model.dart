class UserLeaveRequestQueryModel {
  UserLeaveRequestQueryModel({
       this.leaveRequestsByMe,
  });

  final List<LeaveRequestsByMe>? leaveRequestsByMe;

  factory UserLeaveRequestQueryModel.fromJson(Map<String, dynamic> json){
    return UserLeaveRequestQueryModel(
      leaveRequestsByMe: json["leaveRequestsByMe"] == null ? [] : List<LeaveRequestsByMe>.from(json["leaveRequestsByMe"]!.map((x) => LeaveRequestsByMe.fromJson(x))),
    );
  }

}

class LeaveRequestsByMe {
  LeaveRequestsByMe({
       this.typename,
       this.id,
       this.requestedOn,
       this.leaveType,
       this.leaveFrom,
       this.leaveTill,
       this.totalDays,
       this.halfDay,
       this.reason,
       this.status,
    this.isExpanded,
    //    this.lastUpdate,
       this.teamApproval,
       this.teamleaderId,
  });

  final String? typename;
  final String? id;
  final DateTime? requestedOn;
  final String? leaveType;
  final DateTime? leaveFrom;
  final DateTime? leaveTill;
  final int? totalDays;
  final String? halfDay;
  final String? reason;
  final dynamic status;
  bool? isExpanded;
  // final DateTime? lastUpdate;
  final String? teamApproval;
  final String? teamleaderId;

  factory LeaveRequestsByMe.fromJson(Map<String, dynamic> json){
    return LeaveRequestsByMe(
      typename: json["__typename"],
      id: json["id"],
      isExpanded: json['isExpanded'],
      requestedOn: DateTime.tryParse(json["requestedOn"] ?? ""),
      leaveType: json["leaveType"],
      leaveFrom: DateTime.tryParse(json["leaveFrom"] ?? ""),
      leaveTill: DateTime.tryParse(json["leaveTill"] ?? ""),
      totalDays: json["totalDays"],
      halfDay: json["halfDay"],
      reason: json["reason"],
      status: json["status"],
      // lastUpdate: DateTime.tryParse(json["lastUpdate"] ?? ""),
      teamApproval: json["teamApproval"],
      teamleaderId: json["teamleaderId"],
    );
  }

}
