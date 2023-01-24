import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String url;

  const User({
    required this.id,
    required this.name,
    required this.url,
  });
  //

  //

  static User fromJson(json) => User(
        id: json["id"],
        name: json["displayName"],
        url: json["photoUrl"],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, url];
}
