import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:security_app/constent.dart';
import 'package:http/http.dart' as http;
import '../Authentication/login_data.dart';
import '../provider/complaint_data_modal.dart';

////////////////////////////////////////////////////////////////////////////////
class ComplaintPagination extends StatefulWidget {
  const ComplaintPagination({Key? key}) : super(key: key);

  @override
  State<ComplaintPagination> createState() => _ComplaintPaginationState();
}

class _ComplaintPaginationState extends State<ComplaintPagination> {
  List<GetComplaintData>? complaintData;
  int currentPage = 1;
  @override
  void initState() {
    super.initState();
    getComplaintData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: complaintData!.length,
              itemBuilder: (BuildContext context, int index) {
                final user = complaintData![index];
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 100,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.fromLTRB(15, 15, 10, 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      user.nature.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(user.landmark.toString()),
                                    IconButton(
                                        onPressed: () {
                                          if (user.id == 2) {
                                            print("click to view");
                                          }
                                        },
                                        icon: const Icon(Icons.remove_red_eye)),
                                  ]),
                              const SizedBox(
                                height: 2,
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 1,
                                endIndent: 2,
                                height: 1,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(user.firstname.toString()),
                                  Text(user.ctsno.toString()),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.file_copy))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (complaintData!.length < complaintData!.length)
                OutlinedButton(
                    onPressed: () {
                      currentPage++;
                    },
                    child: const Text(
                      "Next",
                    )),
              if (complaintData!.length > complaintData!.length)
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        currentPage--;
                      });
                    },
                    child: const Text(
                      "previous",
                    )),
            ],
          )
        ],
      ),
    );
  }

  ///////////////////////////////////////////////////////////////////////////////
  Future<void> getComplaintData() async {
    String token = await getToken();
    final url = Uri.parse('${basedUrl}complaint$currentPage');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(url, headers: headers);

    final result = jsonDecode(response.body);
    print(result);

    complaintData = result['data']
        .map((data) => GetComplaintData.fromJson(data))
        .toList()
        .cast<GetComplaintData>();

    print(complaintData);
    setState(() {});
  }
}
