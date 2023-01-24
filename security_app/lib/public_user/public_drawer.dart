import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:security_app/Authentication/login_data.dart';
import 'package:security_app/constent.dart';
import 'package:security_app/public_user/home.dart';
import '../Authentication/login.dart';
import '../provider/auth.dart';
import '../public_user/complaint_dropdown.dart';
import '../Authentication/login_data.dart';

class PublicDrawer extends StatefulWidget {
  const PublicDrawer({Key? key}) : super(key: key);

  @override
  State<PublicDrawer> createState() => _PublicDrawerState();
}

enum drawerSection { dashbord, complaint, logout }

class _PublicDrawerState extends State<PublicDrawer> {
  //
  File? imageFile;
  String? imageData;
  final picker = ImagePicker();
  String? userName;
  String? emailId;
  //

  //
  @override
  void initState() {
    super.initState();
    userdata();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
    );
  }

  //
  Widget buildHeader(BuildContext context) {
    // userName = Provider.of<Auth>(context, listen: false).userName;
    // emailId = Provider.of<Auth>(context, listen: false).emailId;

    return UserAccountsDrawerHeader(
      otherAccountsPictures: const [],
      accountEmail: Text("$emailId"),
      accountName: Text("$userName"),
      currentAccountPicture: const CircleAvatar(
        backgroundImage: NetworkImage(profileImage),
      ),
    );
  }

  //
  Widget buildMenuItems(BuildContext context) {
    const hoverColor = Colors.white70;
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16, //verticle spacing
        children: [
          ListTile(
            hoverColor: hoverColor,
            iconColor: Colors.green.shade300,
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomeUserScreen()));
            },
          ),
          ListTile(
            hoverColor: hoverColor,
            iconColor: Colors.green.shade300,
            leading: const Icon(Icons.warning),
            title: const ComplaintDropdown(),
          ),
          ListTile(
            hoverColor: hoverColor,
            iconColor: Colors.green.shade300,
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginUserPage.routeName, (route) => false);
            },
          )
        ],
      ),
    );
  }

  void userdata() async {
    print("working ");
    String name = await getname();
    print(name);
    String emailid = await getEmail();
    print(emailid);
    setState(() {
      userName = name;
      emailId = emailid;
    });
  }
}
