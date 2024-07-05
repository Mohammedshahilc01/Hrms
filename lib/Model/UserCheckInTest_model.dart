class UserCheckInTestModel {
  UserCheckInTestModel({
    required this.typename,
    required this.todayUserAttendanceDetails,
  });

  final String? typename;
  final List<TodayUserAttendanceDetail> todayUserAttendanceDetails;

  factory UserCheckInTestModel.fromJson(Map<String, dynamic> json){
    return UserCheckInTestModel(
      typename: json["__typename"],
      todayUserAttendanceDetails: json["todayUserAttendanceDetails"] == null ? [] : List<TodayUserAttendanceDetail>.from(json["todayUserAttendanceDetails"]!.map((x) => TodayUserAttendanceDetail.fromJson(x))),
    );
  }

}

class TodayUserAttendanceDetail {
  TodayUserAttendanceDetail({
    required this.typename,
    required this.checkIn,
    required this.checkOut,
    required this.totalWorkingHours,
    required this.lastUpdate,
  });

  final String? typename;
  final DateTime? checkIn;
  final String? checkOut;
  final String? totalWorkingHours;
  final DateTime? lastUpdate;

  factory TodayUserAttendanceDetail.fromJson(Map<String, dynamic> json){
    return TodayUserAttendanceDetail(
      typename: json["__typename"],
      checkIn: DateTime.tryParse(json["checkIn"] ?? ""),
      checkOut: json["checkOut"],
      totalWorkingHours: json["totalWorkingHours"],
      lastUpdate: DateTime.tryParse(json["lastUpdate"] ?? ""),
    );
  }

}
