class UserCheckInLoginTestModel {
    UserCheckInLoginTestModel({
        required this.data,
    });

    final Data? data;

    factory UserCheckInLoginTestModel.fromJson(Map<String, dynamic> json){
        return UserCheckInLoginTestModel(
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

}

class Data {
    Data({
        required this.login,
    });

    final Login? login;

    factory Data.fromJson(Map<String, dynamic> json){
        return Data(
            login: json["login"] == null ? null : Login.fromJson(json["login"]),
        );
    }

}

class Login {
    Login({
        required this.loginSet,
    });

    final bool? loginSet;

    factory Login.fromJson(Map<String, dynamic> json){
        return Login(
            loginSet: json["set"],
        );
    }

}
