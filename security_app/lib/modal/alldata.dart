class AllData {
  int? totalCases;

  AllData({required this.totalCases});
}

class UserData {
  int? totalUser;
  UserData({required this.totalUser});
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      totalUser: json['data']['totaluser'],
      // mobile: json['user']['mobile'],
    );
  }
}
