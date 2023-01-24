import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:security_app/constent.dart';
import '../Authentication/login_data.dart';
import '../public_user/complaints.dart';
import '../public_user/public_complaints_list.dart';
import 'package:http/http.dart' as http;

//

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  int? totalCase;
  int? newCase;
  int? completeCases;
  int? inprocess;
  @override
  void initState() {
    super.initState();
    dashbordData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 2,
              child: Container(
                height: 150,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Total Cases",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        totalCase != null ? "$totalCase" : 'not found',
                        textDirection: TextDirection.ltr,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 2,
              child: Container(
                height: 150,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "New Cases",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "${newCase}",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 2,
              child: Container(
                height: 150,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Completed Cases",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "${completeCases}",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 2,
              child: Container(
                height: 180,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "In Process Cases",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "$inprocess",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> dashbordData() async {
    String token = await getToken();
    final url = Uri.parse('${basedUrl}dashboard');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    final responseData = jsonDecode(response.body);
    print(responseData["data"]);

    final totalCase1 = responseData["data"]['totalcases'];
    final completedcases1 = responseData["data"]['completedcases'];
    final inprocesscases1 = responseData["data"]['inprocesscases'];
    final newcase = responseData["data"]['newcases'];
    print(totalCase1);
    setState(() {
      totalCase = totalCase1;
      inprocess = inprocesscases1;
      completeCases = completedcases1;
      newCase = newcase;
    });
  }
}
