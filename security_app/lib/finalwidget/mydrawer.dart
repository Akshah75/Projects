import 'package:flutter/material.dart';
import 'package:security_app/Authentication/login.dart';
import 'package:security_app/public_user/home.dart';
import '../public_user/complaints.dart';
import 'package:provider/provider.dart';
import '../provider/auth.dart';
import '../constent.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
//
  File? imageFile;
  String? imageData;
  final picker = ImagePicker();
  String? userName;
  String? emailId;

  //
  @override
  Widget build(BuildContext context) {
    //
    return Drawer(
      // backgroundColor: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    userName = Provider.of<Auth>(context, listen: false).userName;
    emailId = Provider.of<Auth>(context, listen: false).emailId;

    print(userName);
    return
        // margin: EdgeInsets.all(16),
        Container(
      child: UserAccountsDrawerHeader(
        otherAccountsPictures: [],
        accountEmail: Text("${emailId}"),
        accountName: Text("${userName}"),
        currentAccountPicture: const CircleAvatar(
          backgroundImage: NetworkImage(profileImage),
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16, //verticle spacing
        children: [
          // ListTile(
          //   title: const Text('Dashboard'),
          //   onTap: () {
          //     Navigator.of(context).pushReplacement(MaterialPageRoute(
          //         builder: (context) => const DashbordScreen()));
          //   },
          // ),
          ListTile(
            // leading: Icon(Icons.dashboard_customize_rounded),
            title: const Text('Complaints'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Complaints()));
            },
          ),
          // ListTile(
          //   // leading: Icon(Icons.dashboard_customize_rounded),
          //   title: const Text('Dashbord'),
          //   onTap: () {
          //     Navigator.of(context).pushReplacement(MaterialPageRoute(
          //         builder: (context) => const DashbordScreen()));
          //   },
          // ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            title: const Text('About Us'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeUserScreen()));
            },
          ),
          ListTile(
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeUserScreen()));
            },
          ),
          ListTile(
            title: const Text('LogOut'),
            onTap: () {
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context).pushNamed(LoginUserPage.routeName);
            },
          )
        ],
      ),
    );
  }

  //
  // Future<String?> pickImage() async {
  //   final pickedImage = await picker.getImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     setState(() {
  //       imageFile = File(pickedImage.path);
  //     });
  //     imageData = base64Encode(imageFile!.readAsBytesSync());
  //     return imageData;
  //   } else {
  //     return null;
  //   }
  // }
  //
  Future<void> getImage() async {
    // ignore: deprecated_member_use
    final PickedFile = await picker.getImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      setState(() {
        imageFile = File(PickedFile.path);
      });
    } else {
      print('No image selected');
    }
  }
}
