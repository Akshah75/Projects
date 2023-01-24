class ProfileDetailed {
  String name;
  int mobile;
  String address;

  //
  ProfileDetailed(
      {required this.name, required this.mobile, required this.address});
  //
  factory ProfileDetailed.fromJson(Map<String, dynamic> json) {
    return ProfileDetailed(
      name: json['name'],
      mobile: json['mobile'],
      address: json['address'],
    );
  }
}
