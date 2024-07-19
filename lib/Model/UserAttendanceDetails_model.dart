class UserAttendanceDetailsModel {
  UserAttendanceDetailsModel({
    required this.typename,
    required this.userAttendanceDetails,
  });

  final String? typename;
  final List<UserAttendanceDetail> userAttendanceDetails;

  factory UserAttendanceDetailsModel.fromJson(Map<String, dynamic> json){
    return UserAttendanceDetailsModel(
      typename: json["__typename"],
      userAttendanceDetails: json["userAttendanceDetails"] == null ? [] : List<UserAttendanceDetail>.from(json["userAttendanceDetails"]!.map((x) => UserAttendanceDetail.fromJson(x))),
    );
  }

}

class UserAttendanceDetail {
  UserAttendanceDetail({
    required this.typename,
    required this.id,
    required this.checkIn,
    required this.checkOut,
    required this.totalWorkingHours,
    required this.lastUpdate,
  });

  final String? typename;
  final String? id;
  final DateTime? checkIn;
  final dynamic checkOut;
  final String? totalWorkingHours;
  final DateTime? lastUpdate;

  factory UserAttendanceDetail.fromJson(Map<String, dynamic> json){
    return UserAttendanceDetail(
      typename: json["__typename"],
      id: json["id"],
      checkIn: DateTime.tryParse(json["checkIn"] ?? ""),
      checkOut: json["checkOut"],
      totalWorkingHours: json["totalWorkingHours"],
      lastUpdate: DateTime.tryParse(json["lastUpdate"] ?? ""),
    );
  }

}
