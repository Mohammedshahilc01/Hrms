class UserCheckOutModel {
  UserCheckOutModel({
    required this.data,
  });

  final Data? data;

  factory UserCheckOutModel.fromJson(Map<String, dynamic> json){
    return UserCheckOutModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.checkOut,
  });

  final CheckOut? checkOut;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      checkOut: json["checkOut"] == null ? null : CheckOut.fromJson(json["checkOut"]),
    );
  }

}

class CheckOut {
  CheckOut({
    required this.checkout,
  });

  final Checkout? checkout;

  factory CheckOut.fromJson(Map<String, dynamic> json){
    return CheckOut(
      checkout: json["checkout"] == null ? null : Checkout.fromJson(json["checkout"]),
    );
  }

}

class Checkout {
  Checkout({
    required this.id,
    required this.user,
  });

  final String? id;
  final User? user;

  factory Checkout.fromJson(Map<String, dynamic> json){
    return Checkout(
      id: json["id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

}

class User {
  User({
    required this.id,
  });

  final String? id;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
    );
  }

}
