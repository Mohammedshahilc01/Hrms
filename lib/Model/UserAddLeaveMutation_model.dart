class UserAddLeaveMutationModel {
  UserAddLeaveMutationModel({
    required this.typename,
    required this.addleaveApproval,
  });

  final String? typename;
  final AddleaveApproval? addleaveApproval;

  factory UserAddLeaveMutationModel.fromJson(Map<String, dynamic> json){
    return UserAddLeaveMutationModel(
      typename: json["__typename"],
      addleaveApproval: json["addleaveApproval"] == null ? null : AddleaveApproval.fromJson(json["addleaveApproval"]),
    );
  }

}

class AddleaveApproval {
  AddleaveApproval({
    required this.typename,
    required this.leaveApproval,
  });

  final String? typename;
  final LeaveApproval? leaveApproval;

  factory AddleaveApproval.fromJson(Map<String, dynamic> json){
    return AddleaveApproval(
      typename: json["__typename"],
      leaveApproval: json["leaveApproval"] == null ? null : LeaveApproval.fromJson(json["leaveApproval"]),
    );
  }

}

class LeaveApproval {
  LeaveApproval({
    required this.typename,
    required this.teamleaderId,
    required this.requestedOn,
    required this.leaveType,
    required this.leaveFrom,
    required this.leaveTill,
    required this.totalDays,
    required this.halfDay,
    required this.reason,
  });

  final String? typename;
  final String? teamleaderId;
  final DateTime? requestedOn;
  final String? leaveType;
  final DateTime? leaveFrom;
  final DateTime? leaveTill;
  final String? totalDays;
  final String? halfDay;
  final String? reason;

  factory LeaveApproval.fromJson(Map<String, dynamic> json){
    return LeaveApproval(
      typename: json["__typename"],
      teamleaderId: json["teamleaderId"],
      requestedOn: DateTime.tryParse(json["requestedOn"] ?? ""),
      leaveType: json["leaveType"],
      leaveFrom: DateTime.tryParse(json["leaveFrom"] ?? ""),
      leaveTill: DateTime.tryParse(json["leaveTill"] ?? ""),
      totalDays: json["totalDays"],
      halfDay: json["halfDay"],
      reason: json["reason"],
    );
  }

}
