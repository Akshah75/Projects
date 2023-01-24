class UserComplaintData {
  int id;
  String name;
  String nature;
  int mobile;
  UserComplaintData(
      {required this.id,
      required this.mobile,
      required this.name,
      required this.nature});
  //
  static UserComplaintData fromJson(json) => UserComplaintData(
      id: json["id"],
      mobile: json["mobile"],
      name: json["name"],
      nature: json["nature"]);
}
