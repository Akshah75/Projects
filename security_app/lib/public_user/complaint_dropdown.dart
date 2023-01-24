import 'package:flutter/material.dart';
import 'package:security_app/public_user/complaint_list_screen.dart';
import '../public_user/complaints.dart';
import '../public_user/public_complaints_list.dart';

//
class ComplaintDropdown extends StatefulWidget {
  const ComplaintDropdown({Key? key}) : super(key: key);

  @override
  State<ComplaintDropdown> createState() => _ComplaintDropdownState();
}

class _ComplaintDropdownState extends State<ComplaintDropdown> {
  final section = ['Complaints', 'Add Complaint', 'Compalint List'];
  String? value = 'Complaints';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          iconSize: 36,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
          items: section.map(buildMenuItem).toList(),
          onChanged: (value) => setState(() {
            this.value = value;
            if (value == section[1]) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Complaints()));
            } else if (value == section[2]) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  ComplaintListScreen.routeName, (route) => false);
            }
          }),
        ),
      ),
    );
  }

//
  DropdownMenuItem<String> buildMenuItem(String section) {
    return DropdownMenuItem(
      value: section,
      child: Text(
        section,
      ),
    );
  }
}
