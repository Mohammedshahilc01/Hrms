class UserCheckInModel {
  UserCheckInModel({
    required this.data,
  });

  final Data? data;

  factory UserCheckInModel.fromJson(Map<String, dynamic> json){
    return UserCheckInModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.checkInUpdate,
  });

  final CheckInUpdate? checkInUpdate;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      checkInUpdate: json["checkInUpdate"] == null ? null : CheckInUpdate.fromJson(json["checkInUpdate"]),
    );
  }

}

class CheckInUpdate {
  CheckInUpdate({
    required this.checkin,
  });

  final Checkin? checkin;

  factory CheckInUpdate.fromJson(Map<String, dynamic> json){
    return CheckInUpdate(
      checkin: json["checkin"] == null ? null : Checkin.fromJson(json["checkin"]),
    );
  }

}

class Checkin {
  Checkin({
    required this.id,
    required this.user,
  });

  final String? id;
  final User? user;

  factory Checkin.fromJson(Map<String, dynamic> json){
    return Checkin(
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
