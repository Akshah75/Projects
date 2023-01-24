class UserDetailForRegistration {
  int? id;
  int? usertype;
  String? name;
  String? mobile;
  String? email;
  String? address;
  String? password;
  String? token;

  UserDetailForRegistration({
    this.id,
    this.usertype,
    this.name,
    this.mobile,
    this.email,
    this.address,
    this.password,
    this.token,
  });
  ///////////////////////////////////////
  //Function to connect json data to user model
  factory UserDetailForRegistration.fromJson(Map<String, dynamic> json) {
    return UserDetailForRegistration(
      id: json['id'],
      usertype: json['user_type'],
      name: json['name'],
      mobile: json['mobile'],
      email: json['email'],
      address: json['address'],
      password: json['password'],
      token: json['token'],
    );
  }
}
