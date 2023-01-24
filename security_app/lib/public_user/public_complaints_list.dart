import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth.dart';

class PublicComplaintList extends StatefulWidget {
  const PublicComplaintList({Key? key}) : super(key: key);

  @override
  State<PublicComplaintList> createState() => _PublicComplaintListState();
  static const routeName = '/complaintList';
}

class _PublicComplaintListState extends State<PublicComplaintList> {
  String? nature;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complaints List')),
      body: Center(
        child: Stack(
          children: [
            const Padding(padding: EdgeInsets.all(8.0)),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nature.toString()),
              ],
            ),
            TextButton(
                onPressed: complaint,
                child: const Text(
                  "get status",
                )),
          ],
        ),
      ),
    );
  }

  //
  void complaint() {
    print("work");
    final comData = Provider.of<Auth>(context, listen: false).nature;
    nature = comData;
    setState(() {});
    print(nature);
  }
}
