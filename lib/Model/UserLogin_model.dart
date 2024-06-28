class UserLoginModel {
  UserLoginModel({
      this.typename,
      this.id,
      this.email,
      this.username,
      this.firstName,
      this.lastName,
      this.teamLeader,
      this.empId,
      this.role,
      this.department,
      this.designation,
      this.address,
      this.login,
      this.logout,
      this.isActive,
  });

  final String? typename;
  final String? id;
  final String? email;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? teamLeader;
  final String? empId;
  final String? role;
  final String? department;
  final String? designation;
  final String? address;
  final bool? login;
  final bool? logout;
  final bool? isActive;

  factory UserLoginModel.fromJson(Map<String, dynamic> json){
    return UserLoginModel(
      typename: json["typename"],
      id: json["id"],
      email: json["email"],
      username: json["username"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      teamLeader: json["teamleader"],
      empId: json["empid"],
      role: json["role"],
      department: json["department"],
      designation: json["designation"],
      address: json["address"],
      // login: json["login"],
      // logout: json["logout"],
      // isActive: json["isActive"],
    );
  }

}
