class UserCheckOutLogOutModel {
  UserCheckOutLogOutModel({
    required this.typename,
    required this.logout,
  });

  final String? typename;
  final Logout? logout;

  factory UserCheckOutLogOutModel.fromJson(Map<String, dynamic> json){
    return UserCheckOutLogOutModel(
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
