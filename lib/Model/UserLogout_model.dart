class UserLogoutModel {
  UserLogoutModel({
    required this.typename,
    required this.logout,
  });

  final String? typename;
  final Logout? logout;

  factory UserLogoutModel.fromJson(Map<String, dynamic> json){
    return UserLogoutModel(
      typename: json["__typename"],
      logout: json["logout"] == null ? null : Logout.fromJson(json["logout"]),
    );
  }

}

class Logout {
  Logout({
    required this.typename,
    required this.logoutSet,
  });

  final String? typename;
  final bool? logoutSet;

  factory Logout.fromJson(Map<String, dynamic> json){
    return Logout(
      typename: json["__typename"],
      logoutSet: json["set"],
    );
  }

}
