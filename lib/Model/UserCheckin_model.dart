class UserCheckInModel {
  UserCheckInModel({
    required this.typename,
    required this.checkInUpdate,
  });

  final String? typename;
  final CheckInUpdate? checkInUpdate;

  factory UserCheckInModel.fromJson(Map<String, dynamic> json){
    return UserCheckInModel(
      typename: json["__typename"],
      checkInUpdate: json["checkInUpdate"] == null ? null : CheckInUpdate.fromJson(json["checkInUpdate"]),
    );
  }

}

class CheckInUpdate {
  CheckInUpdate({
    required this.typename,
    required this.checkInUpdateSet,
    required this.checkin,
  });

  final String? typename;
  final bool? checkInUpdateSet;
  final Checkin? checkin;

  factory CheckInUpdate.fromJson(Map<String, dynamic> json){
    return CheckInUpdate(
      typename: json["__typename"],
      checkInUpdateSet: json["set"],
      checkin: json["checkin"] == null ? null : Checkin.fromJson(json["checkin"]),
    );
  }

}

class Checkin {
  Checkin({
    required this.typename,
    required this.id,
    required this.user,
  });

  final String? typename;
  final String? id;
  final User? user;

  factory Checkin.fromJson(Map<String, dynamic> json){
    return Checkin(
      typename: json["__typename"],
      id: json["id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

}

class User {
  User({
    required this.typename,
    required this.id,
  });

  final String? typename;
  final String? id;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      typename: json["__typename"],
      id: json["id"],
    );
  }

}
