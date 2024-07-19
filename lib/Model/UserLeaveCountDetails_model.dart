class UserLeaveCountDetailsModel {
  UserLeaveCountDetailsModel({
    required this.typename,
    required this.leaveConfigurationByMe,
  });

  final String? typename;
  final List<LeaveConfigurationByMe> leaveConfigurationByMe;

  factory UserLeaveCountDetailsModel.fromJson(Map<String, dynamic> json){
    return UserLeaveCountDetailsModel(
      typename: json["__typename"],
      leaveConfigurationByMe: json["leaveConfigurationByMe"] == null ? [] : List<LeaveConfigurationByMe>.from(json["leaveConfigurationByMe"]!.map((x) => LeaveConfigurationByMe.fromJson(x))),
    );
  }

}

class LeaveConfigurationByMe {
  LeaveConfigurationByMe({
    required this.typename,
    required this.id,
    required this.casualLeave,
    required this.sickLeave,
    required this.earnedLeave,
    required this.restrictedLeave,
    required this.user,
  });

  final String? typename;
  final String? id;
  final int? casualLeave;
  final int? sickLeave;
  final int? earnedLeave;
  final int? restrictedLeave;
  final User? user;

  factory LeaveConfigurationByMe.fromJson(Map<String, dynamic> json){
    return LeaveConfigurationByMe(
      typename: json["__typename"],
      id: json["id"],
      casualLeave: json["casualLeave"],
      sickLeave: json["sickLeave"],
      earnedLeave: json["earnedLeave"],
      restrictedLeave: json["restrictedLeave"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

}

class User {
  User({
    required this.typename,
    required this.id,
    required this.username,
  });

  final String? typename;
  final String? id;
  final String? username;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      typename: json["__typename"],
      id: json["id"],
      username: json["username"],
    );
  }

}
