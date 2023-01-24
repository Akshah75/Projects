import 'package:flutter/material.dart';
import 'package:security_app/public_user/home.dart';

//
class DropdownScreen extends StatefulWidget {
  const DropdownScreen({Key? key}) : super(key: key);

  @override
  State<DropdownScreen> createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  final section = [
    'Listing',
    'Mitting',
    'Complidance',
    'Resoureces',
    'Action taken'
  ];
  String? value = 'Listing';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(3),
      // padding: const EdgeInsets.all()symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.black, width: 4),
          borderRadius: BorderRadius.circular(12)),
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomeUserScreen()));
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
  // void onSelected(BuildContext context ,section){
  //   switch(section){
  //     case section.:
  //   }
  // }
}
