import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:security_app/constent.dart';
import 'package:security_app/provider/complaint_data_modal.dart';
import 'package:security_app/public_user/complaints.dart';
import 'package:security_app/public_user/home.dart';
import '../Authentication/login_data.dart';
import 'package:http/http.dart' as http;
import '../splashScreen/loading.dart';
import 'complaint_log.dart';
import 'complaint_view.dart';

//
class ComplaintListScreen extends StatefulWidget {
  const ComplaintListScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintListScreen> createState() => _ComplaintListScreenState();
  static const routeName = '/complaintList';
}

class _ComplaintListScreenState extends State<ComplaintListScreen> {
  final searchController = TextEditingController();
  List<GetComplaintData>? complaintData;
  int currentPage = 1;
  String? nextPageUrl;
  String? prevpgeUrl;

  int? totalpage;
  int? totalcount;
  bool isLoading = false;
  // late var totalcount = totalpage != null ? (totalpage! / 5).ceil() : null;
  @override
  void initState() {
    super.initState();
    print(totalcount);
    getComplaintData();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Complaints List'),
          actions: [
            Container(
              margin: const EdgeInsets.all(10),
              child: IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomeUserScreen.routeName, (route) => false);
                },
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.all(10),
            //   child: IconButton(
            //     icon: const Icon(Icons.search),
            //     onPressed: () {
            //       showSearch(
            //         context: context,
            //         delegate: MySearchDelegate(),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
        body: totalcount != null
            ? Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: searchController,
                      autofocus: false,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                        labelText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  if (complaintData != null) getList(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // OutlinedButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         currentPage++;
                        //         getComplaintData();
                        //       });
                        //     },
                        //     child: Text("First")),
                        // currentPage != 1
                        //     ?
                        OutlinedButton(
                            onPressed: () {
                              if (currentPage <= 1) {
                                return;
                              } else
                                setState(() {
                                  currentPage--;
                                  getComplaintData();
                                });
                            },
                            child: Text("Previous")),
                        // : Container(),
                        Row(
                          children: [
                            Text("$currentPage/"),
                            Text("$totalcount"),
                          ],
                        ),

                        //////////////////////////////////////////////////////////////////////////////
                        // currentPage != totalcount
                        //     ?
                        OutlinedButton(
                            onPressed: () {
                              if (currentPage >= totalcount!) {
                                return;
                              } else {
                                setState(() {
                                  currentPage++;
                                  getComplaintData();
                                });
                              }
                            },
                            child: Text("Next"))
                      ],
                    ),
                  )
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        text:
                            "No Complaint filed at the moment.\nwant to List one.",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                          color: Colors.green.shade300,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => const Complaints())));
                          },
                          child: const Text(
                            "Add Complaint",
                          )),
                    ),
                  ],
                ),

                // child: Text(
                //     "No Complaint filed at the moment.want to List one.\n ",)
              ));
  }

  Future<void> getComplaintData() async {
    String token = await getToken();
    final url = Uri.parse('${basedUrl}complaint?page=$currentPage');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(url, headers: headers);
    // {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $token'
    // });
    final result = jsonDecode(response.body);
    print(result["data"]["data"]);
    final totalpage = result["data"]["total"];
    print("page:$totalpage");
    currentPage = result["data"]["current_page"];
    print(currentPage);
    nextPageUrl = result["data"]["next_page_url"];
    print("next:$nextPageUrl");
    prevpgeUrl = result["data"]["prev_page_url"];
    print("prev:$prevpgeUrl");
    // print("lenght: ${dataLenth}");
    totalcount = (totalpage / 3).ceil();
    print("count:$totalcount");

    // print("page$totalpage");

    complaintData = result['data']["data"]
        .map((data) => GetComplaintData.fromJson(data))
        .toList()
        .cast<GetComplaintData>();

    print(complaintData);
    setState(() {});

    //////////////////////////////////////////////
    ///

    List filtred = [];
    result["data"]["data"].forEach(
      (filtre) {
        if (filtre["cno"] == filtre["cno"]) filtred.add(filtre["cno"]);
      },
    );
    print("fil$filtred");
  }

  Widget getList() {
    return Expanded(
        child: complaintData != null
            ? ListView.builder(
                itemCount: complaintData!.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = complaintData![index];
                  return Container(
                    width: double.infinity,
                    // decoration: BoxDecoration(border: Border.all()),
                    // padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          // color: Color.fromRGBO(10, 241, 10, 0.4),

                          // .primaries[Random().nextInt(Colors.primaries.length)]
                          // .shade200,
                          elevation: 100,
                          child: Container(
                            width: double.infinity,
                            height: 190,
                            decoration: BoxDecoration(
                                // border: Border.all(),s
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
                                        user.ownershiptype.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(user.landmark.toString()),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Complaintview(user)));
                                            print("click to view");
                                          },
                                          icon:
                                              const Icon(Icons.remove_red_eye)),
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
                                    Text(user.primarycontact.toString()),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ComplaintLogs(user)));
                                        },
                                        icon: const Icon(Icons.file_copy))
                                  ],
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
                                    Text(user.ctsno.toString()),
                                    Text(user.district.toString()),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                  margin:
                                                      const EdgeInsets.all(10),
                                                  child: AlertDialog(
                                                    title: const Text(
                                                        "Delete Complaint"),
                                                    content: const Text(
                                                        "Do you want delete your complent?"),
                                                    actions: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          ElevatedButton.icon(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            label: const Text(
                                                                "cancel"),
                                                            icon: const Icon(
                                                                Icons.cancel),
                                                          ),
                                                          ElevatedButton.icon(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    primary:
                                                                        Colors
                                                                            .red),
                                                            onPressed: () {
                                                              loadingIndicator(
                                                                  context);
                                                              deleteList(user
                                                                  .id!
                                                                  .toInt());

                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          2),
                                                                  () {
                                                                Navigator.pushNamedAndRemoveUntil(
                                                                    context,
                                                                    ComplaintListScreen
                                                                        .routeName,
                                                                    (route) =>
                                                                        false);
                                                              });
                                                            },
                                                            label: const Text(
                                                                "Delete"),
                                                            icon: const Icon(
                                                                Icons.delete),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                          // Get.defaultDialog(
                                          //     title: "Delete Complant");
                                        },
                                        icon: const Icon(Icons.delete))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                })
            : const Center(
                child: Text(
                  "No complaint found!",
                  style: TextStyle(fontSize: 18),
                ),
              ));
  }

  Future<void> deleteList(int id) async {
    String token = await getToken();
    final url = Uri.parse('${basedUrl}complaint/$id');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.delete(url, headers: headers);
    final result = jsonDecode(response.body);
    //

    print(result);
  }

  ///////////////////////////////////////////////////////////
  void loadingIndicator(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const LoadingIndicator()));
  }
}



// Widget buildSearch() =>
//     SearchWidget(text: query, hintText: "Search your complaint", onChanged:);
