//  Future signIn() async {
//     final user = await GoogleSignInApi.login();
//     print(user);
//     setState(() {
//       username = user!.displayName;
//       url = user.photoUrl;
//     });
//   }
// }

// 
//   Future signIn() async {
//     final user = await GoogleSignInApi.login();
//     print(user);
//     setState(() {
//       username = user!.displayName;
//       url = user.photoUrl;
//     });
//   }
// }

// class GoogleSignInApi {
//   static final _googleSignIn = GoogleSignIn();

//   static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
//   static Future logout() => _googleSignIn.disconnect();
// }
