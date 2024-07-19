class UserDetailsModel {
  UserDetailsModel({
    required this.typename,
    required this.userDetail,
  });

  final String? typename;
  final UserDetail? userDetail;

  factory UserDetailsModel.fromJson(Map<String, dynamic> json){
    return UserDetailsModel(
      typename: json["__typename"],
      userDetail: json["userDetail"] == null ? null : UserDetail.fromJson(json["userDetail"]),
    );
  }

}

class UserDetail {
  UserDetail({
    required this.typename,
    required this.id,
    required this.password,
    required this.lastLogin,
    required this.isSuperuser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.email,
    required this.address,
    required this.contactno,
    required this.dob,
    required this.location,
    required this.gender,
    required this.login,
    required this.logout,
    required this.role,
    required this.lastUpdate,
    required this.department,
    required this.designation,
    required this.empid,
    required this.attendanceId,
    required this.teamleader,
  });

  final String? typename;
  final String? id;
  final String? password;
  final dynamic lastLogin;
  final bool? isSuperuser;
  final String? username;
  final String? firstName;
  final String? lastName;
  final bool? isStaff;
  final bool? isActive;
  final DateTime? dateJoined;
  final String? email;
  final String? address;
  final String? contactno;
  final String? dob;
  final String? location;
  final String? gender;
  final DateTime? login;
  final DateTime? logout;
  final String? role;
  final DateTime? lastUpdate;
  final String? department;
  final String? designation;
  final String? empid;
  final int? attendanceId;
  final String? teamleader;

  factory UserDetail.fromJson(Map<String, dynamic> json){
    return UserDetail(
      typename: json["__typename"],
      id: json["id"],
      password: json["password"],
      lastLogin: json["lastLogin"],
      isSuperuser: json["isSuperuser"],
      username: json["username"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      isStaff: json["isStaff"],
      isActive: json["isActive"],
      dateJoined: DateTime.tryParse(json["dateJoined"] ?? ""),
      email: json["email"],
      address: json["address"],
      contactno: json["contactno"],
      dob: json["dob"],
      location: json["location"],
      gender: json["gender"],
      login: DateTime.tryParse(json["login"] ?? ""),
      logout: DateTime.tryParse(json["logout"] ?? ""),
      role: json["role"],
      lastUpdate: DateTime.tryParse(json["lastUpdate"] ?? ""),
      department: json["department"],
      designation: json["designation"],
      empid: json["empid"],
      attendanceId: json["attendanceId"],
      teamleader: json["teamleader"],
    );
  }

}
