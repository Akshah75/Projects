import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:security_app/constent.dart';
import 'package:security_app/provider/complaint_data_modal.dart';
import '../Authentication/login_data.dart';
import 'package:http/http.dart' as http;

import 'complaint_logs_json.dart';

//
class ComplaintLogs extends StatefulWidget {
  GetComplaintData? user;
  ComplaintLogs(this.user, {Key? key}) : super(key: key);

  @override
  State<ComplaintLogs> createState() => _ComplaintLogsState();
}

class _ComplaintLogsState extends State<ComplaintLogs> {
  List<ComplaitLogsData>? complaintLog;

  @override
  void initState() {
    super.initState();
    complaintLogg();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Complaint Logs")),
      body: complaintLog != null
          ? Center(
              child: Container(
                  child: ListView.builder(
                itemCount: complaintLog!.length,
                itemBuilder: (context, index) {
                  final log = complaintLog![index];
                  return Container(
                    // padding: const EdgeInsets.all(),
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 2,
                              height: 80,
                              color: index == 0 ? Colors.white : Colors.black,
                            ),
                            Container(
                              padding: const EdgeInsets.all(6),
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: 2,
                              height: 200,
                              color: index == complaintLog!.length - 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ],
                        ),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 4, color: Colors.green),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(blurRadius: 10, color: Colors.black26)
                              ]),
                          height: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(2),
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    "${log.status}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(2),
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    "${log.nature}",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("${log.remarks}"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(2),
                                      padding: const EdgeInsets.all(2),
                                      child: Row(
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.all(2),
                                              child: const Icon(Icons.people)),
                                          const Text("On-behalf of : "),
                                          Text("${log.handledby}")
                                        ],
                                      ),
                                    ),
                                    Text("${log.date}"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(2),
                                  padding: const EdgeInsets.all(2),
                                  child: Row(
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.all(2),
                                          child: const Icon(Icons.people)),
                                      const Text("Performed By: "),
                                      Text("${log.handledby}")
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    margin: const EdgeInsets.all(2),
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                        "Admin Remarks: ${log.adminremarks}")),
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  );
                },
              )),
            )
          : const Center(
              child: Text("Not assign yet!"),
            ),
    );
  }

  Future<void> complaintLogg() async {
    print("complaint log work");
    String token = await getToken();
    final url = Uri.parse('${basedUrl}complaintlog/${widget.user!.id!}');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final response = await http.get(url, headers: headers);
    final result = jsonDecode(response.body);
    print(result['data']);
    complaintLog = result['data']
        .map((data) => ComplaitLogsData.fromJson(data))
        .toList()
        .cast<ComplaitLogsData>();
    print(complaintLog);
    setState(() {});
  }
}

////////////////////////////////////////////////////////////////////////////////
// class TimeLine extends StatefulWidget {
//   GetComplaintData? user;
//   TimeLine(
//     this.user, {
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<TimeLine> createState() => _TimeLineState();
// }

// class _TimeLineState extends State<TimeLine> {
//   List<Color> colors = [Colors.red, Colors.green, Colors.black];

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

////////////////////////////////////////////////////////////////////////////
