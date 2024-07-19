class UserCheckInLoginModel {
    UserCheckInLoginModel({
        required this.typename,
        required this.login,
    });

    final String? typename;
    final Login? login;

    factory UserCheckInLoginModel.fromJson(Map<String, dynamic> json){
        return UserCheckInLoginModel(
            typename: json["__typename"],
            login: json["login"] == null ? null : Login.fromJson(json["login"]),
        );
    }

}

class Login {
    Login({
        required this.typename,
        required this.loginSet,
    });

    final String? typename;
    final bool? loginSet;

    factory Login.fromJson(Map<String, dynamic> json){
        return Login(
            typename: json["__typename"],
            loginSet: json["set"],
        );
    }

}
