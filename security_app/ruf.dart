//
// Future<void> fileupload() async {
//   print("working??");
//   final url = basedUrl + 'testing';
//   print(url);
//   final stream = http.ByteStream(DelegatingStream.typed(image!.openRead()));
//   final length = await image!.length();
//   Map<String, String> headers = {
//     'Accept': 'applicatin/json',
//   };
//   var request = http.MultipartRequest('POST', Uri.parse(url));
//   var multipartFileSign = http.MultipartFile('file', stream, length,
//       filename: basename(image!.path));
//   //
//   request.files.add(multipartFileSign);
//   final res = await request.send();
//   res.stream.transform(utf8.decoder).listen((event) {
//     print(event);
//   });
// }
//  Future<void> selectFile() async {
//   final selectfile =
//       await ImagePicker.platform.getImage(source: ImageSource.gallery);
//   // print(selectfile!.names);
// }

// // Future<void> owner(List owners) async {
// //   final owner = Provider.of<Auth>(context, listen: false).owenershiptype;
// //   Future.wait(owners.map((e) => ));

// //   print(owner);
// // }
// //
// Future<void> getImage() async {
//   final PickedFile = await picker.getImage(source: ImageSource.gallery);
//   if (PickedFile != null) {
//     setState(() {
//       image = File(PickedFile.path);
//     });
//   } else {
//     print('No image selected');
//   }
// }
///////////////////////////////////
/////important code
// void uploadPic() {
//   var owner = Provider.of<Auth>(context, listen: false).owenershiptype();
// owner = Provider.of<Auth>(context, listen: false).owner as Map;
// print(owner);
// // print(owner);
// owner.forEach(
//   (key, value) {
//     print('working');
//     print(value);
//     typeOfOwner.addAll(value);
//     print(typeOfOwner);
//   },
// );
// .fileupload(image!);
// }

// Container(
//                     width: 500,
//                     height: 250,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Expanded(
//                         child: Column(
//                       children: [],
//                     )),
//                   ),
//

// for (int i = 0; i < storedFiles!.length; i++) {
//   var path = storedFiles![i].path;
//   print("working" + path);
//   //
//   File imageFile = File(path);
//   var stream = http.ByteStream(imageFile.openRead());
//   var length = await imageFile.length();
//   var multipartFile = http.MultipartFile("file[]", stream, length,
//       filename: basename(imageFile.path));
//   newFiles.add(multipartFile);
// }
// final req = await request.send();

// //

// request.files.addAll(newFiles);
//     File? pickedImage;
// Future pickImage() async {
//   try {
//     final pickedImageFile =
//         await ImagePicker().pickImage(source: ImageSource.camera);

//     if (pickedImageFile == null) return;
//     //
//     final imagetempory = File(pickedImageFile.path);
//     setState(() {
//       this.pickedImage = imagetempory;
//     });
//     widget.imagePickFn(imagetempory);
//     // final ref=Fire
//   } on PlatformException catch (e) {
//     print(e);
//   }
// }
// Future<void> fileUpload() async {
//   print("working??");
//   final url = basedUrl + 'testing';
//   print(url);
//   final stream = http.ByteStream(DelegatingStream.typed(image!.openRead()));
//   final length = await image!.length();
//   Map<String, String> headers = {
//     'Accept': 'applicatin/json',
//   };
//   var request = http.MultipartRequest('POST', Uri.parse(url));
//   var multipartFileSign = http.MultipartFile('file', stream, length,
//       filename: basename(image!.path));
//   //
//   request.files.add(multipartFileSign);
//   final res = await request.send();
//   res.stream.transform(utf8.decoder).listen((event) {
//     print(event);
//   });
// }

//
// static List<UserComplaintData> getUser() {
//   const data = [
//     {
//       'id': 1,
//       'name': 'complaint no :',
//       'nature': "nature",
//       'mobile': 21234,
//     },
//     {
//       'id': 2,
//       'name': 'name',
//       'nature': "nature",
//       'mobile': 212373,
//     },
// {
//   'id': 3,
//   'name': 'name',
//   'nature': "nature",
//   'mobile': 260934746,
// },
// {
//   'id': 3,
//   'name': 'name',
//   'nature': "nature",
//   'mobile': 260934746,
// },
// {
//   'id': 4,
//   'name': 'name',
//   'nature': "nature",
//   'mobile': 260934746,
// },
// {
//   'id': 5,
//       'name': 'name',
//       'nature': "nature",
//       'mobile': 260934746,
//     },
//     {
//       'id': 6,
//       'name': 'name',
//       'nature': "nature",
//       'mobile': 260934746,
//     }
//   ];
//   return data.map<UserComplaintData>(UserComplaintData.fromJson).toList();
// }

// List<UserComplaintData> users = getUser();

//
// Future<List<GetComplaintData>> complaintData = getComplaintData();
//
// complaintData = json.decode(response.body);
// print(complaintData);
// setState(() {});

// complaintData = jsonDecode(response.body)
//     .map((data) {
//       GetComplaintData.fromJson(data);
//     })
//     .toList()
//     .cast<GetComplaintData>();

// setState(() {});

// Card_detail
//   final user = users[index];
//   return Card(
//     color: Colors
//         .primaries[Random().nextInt(Colors.primaries.length)].shade200,
//     child: ListTile(
//       onTap: () {
//         if (user.id == 2) {
//           print("clk");
//         } else {
//           print("click");
//         }
//       },
//       title: Text(user.name),
//       subtitle: Text(user.nature),
//       trailing: Icon(Icons.visibility),
//       // leading: Icon(Icons.check),
//     ),
//   );
// },
//{
//   complaintData = responseData.map((e) {
//     GetComplaintData.fromJson(e);

//     print(e);
//   });
//   print(complaintData);
// }
////////////////////////main data///////////////////
// complaintData = result['data']
//     .map((data) => GetComplaintData.fromJson(data))
//     .toList()
//     .cast<GetComplaintData>();
// //

//
// final responseData = jsonDecode(response.body);
// print(responseData);
// responseData.forEach((data) {
//   GetComplaintData.fromJson(data);
// }).toList();
// print(responseData);
// print("work?");
// print(complaintData);
//////////////
/// //

// for (int i = 0; i < storedFiles!.length; i++) {
//   var path = storedFiles![i].path;
//   print("working" + path);
//   //
//   File imageFile = File(path);
//   var stream = http.ByteStream(imageFile.openRead());
//   var length = await imageFile.length();
//   var multipartFile = http.MultipartFile("file[]", stream, length,
//       filename: basename(imageFile.path));
//   newFiles.add(multipartFile);
// }
// final req = await request.send();

// //

// request.files.addAll(newFiles);
//
// @override
// void dispose() {
// emailController.dispose();
// passwordController.dispose();
// mobileNoController.dispose();
// nameController.dispose();
//   nameController.clear();
//   mobileNoController.clear();
//   super.dispose();
// }
/////////////////////////////////////\
// main function
// Future<void> signUp() async {
//     print('ok');
//     try {
//       final response =
//           await http.post(Uri.parse(basedUrl + 'register'), headers: {
//         'Accept': 'application/json'
//       }, body: {
//         'name': nameController.text,
//         'address': addressController.text,
//         'mobile': mobileNoController.text,
//         'email': emailController.text,
//         'password': passwordController.text,
//         'password_confirmation': confirmPasswordController.text,
//       });
//       print('okk');
//       print(response.body);
//       //
//       switch (response.statusCode) {
//         case 200:
//           print('register Succesfull');
//           break;
//         case 422:
//           final errors = jsonDecode(response.body)['errors'];
//           break;
//       }
//     } catch (e) {}
//   }
///////////////
// Future<void> registerUser() async {
//   print("registerUser is working?");
//   await Provider.of<Auth>(context, listen: false).singup(
//       nameController.text,
//       mobileNoController.text,
//       addressController.text,
//       emailController.text,
//       passwordController.text,
//       confirmPasswordController.text);
//   print('ok');
// }
// @override
// void dispose() {
//   super.dispose();
//   nameController.dispose();
//   mobileNoController.dispose();
//   emailController.dispose();
//   addressController.dispose();
//   passwordController.dispose();
//   clearFiled();
// }
// decoration: const BoxDecoration(
//   image: DecorationImage(
//       // image: NetworkImage(profileImage),
//       image: AssetImage("assets/tree.jpg"),
//       fit: BoxFit.cover),
// ),
// List<String>? files;
// File? image;
// List<http.MultipartFile> newFile = [];
// String? value;
// String userLoc = 'null,pressme';
// bool? _isReadonly;
// Map typeOf Owner = {1: 'Government', 2: 'Non-Government'};

// Map owner = {};
// owners = Provider.of<Auth>(context, listen: false).owner;
// print(owners);
//  else if (usertype == deparmentUser) {
//   // ignore: use_build_context_synchronously
//   Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (context) => const DepartmentScreen()));
// } else if (usertype == departmentAdmin) {
//   // ignore: use_build_context_synchronously
//   Navigator.of(context).pushReplacement(MaterialPageRoute(
//       builder: (context) => const AdminDepartmentScreen()));
// } else if (usertype == superAdmin) {
//   // ignore: use_build_context_synchronously
//   Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (context) => const AdminScreen()));
//   print("Super Admin");
// }
// actions: [
//   Container(
//       padding: EdgeInsets.all(7),
//       child: IconButton(
//         onPressed: () {},
//         icon: const Icon(Icons.logout),
//         iconSize: 28,
//       ))
// ],
// / }

// Future<List<UserComplaintData>> getUser() async {
//   final url = Uri.parse('${basedUrl}complaint');
//   final res = await http.get(url, headers: {
//     'Content-Type': 'application/json',
//     'Authorization': 'Bearer $token'
//   });
//   final responseData = jsonDecode(res.body);
//   print(responseData);

//   return responseData
//       .map<UserComplaintData>(UserComplaintData.fromJson)
//       .toList();
// }
// Future<List<UserComplaintData>> userComplaint = getUser();
// }
// print("wo");
// ApiResponse response = await getcomplaintDetail();
// newsave(response.data as GetComplaintData);
// print(response.data);
// print(res);
// String? fname = await res.getfname();
// print(fname);
// }

// void newsave(GetComplaintData complaintData) async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   await pref.setString('nature', complaintData.nature ?? '');
// }
//
//s
//
// Future<void> login() async {
//   print("working?");
//   await Provider.of<Auth>(context, listen: false)
//       .login(emailController.text, passwordController.text);
//   // ignore: use_build_context_synchronously
//   final usertype = Provider.of<Auth>(context, listen: false).usertype;
//   if (usertype == superAdmin) {
//     // ignore: use_build_context_synchronously
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const AdminScreen()));
//     print("Super Admin");
//   } else if (usertype == publicUser) {
//     // ignore: use_build_context_synchronously
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const HomeUserScreen()));
//   } else if (usertype == departmentAdmin) {
//     // ignore: use_build_context_synchronously
//     Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (context) => const AdminDepartmentScreen()));
//   } else if (usertype == deparmentUser) {
//     // ignore: use_build_context_synchronously
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const DepartmentScreen()));
//   } else {
//     print("login failed");
//   }
// }
// if (token == null) {
//
// } else {
// setState(() {
//   isloading = true;
// });
// isloading
//     ? Navigator.of(context)
//         .push(MaterialPageRoute(builder: ((context) => LoadingIndicator())))
//     : LoginUserPage();
// actions: [
//       Container(
//         margin: const EdgeInsets.all(8),
//         child: IconButton(
//           onPressed: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 LoginUserPage.routeName, (route) => false);
//           },
//           icon: const Icon(Icons.login_outlined),
//         ),
//       ),
//     ],
//    Future<void> login2() async {
//   print("working?");
//   await Provider.of<Auth>(context, listen: false)
//       .login(emailController.text, passwordController.text);
//   // ignore: use_build_context_synchronously
//   final usertype = Provider.of<Auth>(context, listen: false).usertype;
//   if (usertype == publicUser) {
//     // ignore: use_build_context_synchronously
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const HomeUserScreen()));
//   }
// }
//Single file upload
// Future<void> fileUpload() async {
//   String token = await getToken();
//   // ignore: avoid_print
//   print("working??");
//   const url = '${basedUrl}file';
//   // ignore: avoid_print
//   print(url);
//   final stream = http.ByteStream(storedImage!.openRead());
//   final length = await storedImage!.length();
//   Map<String, String> headers = {
//     'Content-Type': 'application/json',
//     'Authorization': 'Bearer $token'
//   };

//   var request = http.MultipartRequest('POST', Uri.parse(url));

//   var multipartFileSign = http.MultipartFile('complaint[]', stream, length,
//       filename: storedImage!.path);
//   request.files.add(multipartFileSign);
//   final res = await request.send();
//   res.stream.transform(utf8.decoder).listen((event) {
//     // ignore: avoid_print
//     print(event);
// //   });
// // }
// SizedBox(
//                       width: 100,
//                       height: 50,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           TextButton(
//                               onPressed: () {
//                                 Navigator.of(context)
//                                     .pushNamed(Complaints.routeName);
//                               },
//                               child: const Text(
//                                 "Add Comaplaint",
//                                 style: TextStyle(fontSize: 16),
//                               )),
//                           TextButton(
//                               onPressed: () {
//                                 Navigator.of(context)
//                                     .pushNamed(PublicComplaintList.routeName);
//                               },
//                               child: const Text(
//                                 "Complaint List",
//                                 style: TextStyle(fontSize: 16),
//                               )),
//                         ],
//                       ),
//                     ),
//
//  Container(
//                         margin: const EdgeInsets.all(10),
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               SignInButton(Buttons.GoogleDark,
//                                   onPressed: () {}),
//                               SignInButton(Buttons.Facebook,
//                                   mini: false, onPressed: () {}),
//                             ]))
// Future<void> registerUser() async {
//   print("registerUser is working?");
//   await Provider.of<Auth>(context, listen: false).singup(
//       nameController.text,
//       mobileNoController.text,
//       addressController.text,
//       emailController.text,
//       passwordController.text,
//       confirmPasswordController.text);
//   print('ok');
// }
// // }
  //
  ///////////
// Future<void> getDashbordData() async {
//   ApiGetDashbord apiGetDashbord = ApiGetDashbord();
//   try {
//     String token = await getToken();
//     final url = Uri.parse('${basedUrl}dashboard');
//     final response = await http.get(url, headers: {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token'
//     });
//     switch (response.statusCode) {
//       case 200:
//         apiGetDashbord.data = User.fromJson(jsonDecode(response.body));
//         print(apiGetDashbord.data);
//         break;
//       default:
//         print('something went wrong');
//     }
// //
//   } catch (e) {
//     print("something wrong");
//   }
// return;
// }
/////////////////dashbord data//////
// Future<int> getTotalCases(){
//    SharedPreferences pref = await SharedPreferences.getInstance();
//   return pref.getInt('totalUser') ?? 0;

// }
// //
//   // send data
//   void postComplaintData() {
//     Provider.of<Auth>(context, listen: false).postComplaint(
//         controller.text,
//         districtController.text,
//         talukaController.text,
//         localityController.text,
//         0,
//         int.parse(ctsController.text),
//         int.parse(surveyController.text),
//         double.parse(latitudeController.text),
//         double.parse(longitudeController.text),
//         descriptionController.text,
//         firstNameController.text,
//         lastNameController.text,
//         int.parse(mobileNoController.text),
//         addressController.text,
//         storedFiles!

//         // newFile as http.MultipartFile,
//         );
//   }
//
//Single picture get
  // Future<void> takepicture() async {
  //   final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
  // //   if (pickedFile != null) {
  // //     storedImage = File(pickedFile.path.split('/').last);
  // //   }
  // //   setState(() {});
  // //   print(storedImage);
  // // }
  // // multiple file upload
  // Future<void> fileUploads() async {
  //   String token = await getToken();
  //   // ignore: avoid_print
  //   print("working???");
  //   const url = '${basedUrl}complaint';
  //   // ignore: avoid_print
  //   print(url);

  //   //
  //   http.MultipartRequest request = http.MultipartRequest(
  //     'POST',
  //     Uri.parse(url),
  //   );

  //   print(request);

  //   List<http.MultipartFile> newFile = [];

  //   //for loop
  //   for (var img in storedFiles!) {
  //     if (img != null) {
  //       var multiFile = await http.MultipartFile.fromPath(
  //         "complaintfile[]",
  //         File(img.path).path,
  //       );
  //       newFile.add(multiFile);
  //     }
  //   }
  //   print(newFile);

  //   request.files.addAll(newFile);
  //   print(newFile);
  //   //

  //   var response = await request.send();
  //   print(response.toString());

  //   response.stream.transform(utf8.decoder).listen((value) {
  //     print('value');
  //     print(value);
  //   });
  // // }
  // const SizedBox(
  //                 height: 20,
  //               ),
  //               TextFormField(
  //                 controller: entreTalukaController,
  //                 decoration: InputDecoration(
  //                   hintText: 'Enter Taluka',
  //                   filled: true,
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                 ),
  //               ),
  //  TextFormField(
  //                 controller: districtController,
  //                 validator: (val) {
  //                   if (val!.isEmpty) {
  //                     return 'Requred';
  //                   } else {
  //                     return null;
  //                   }
  //                 },
  //                 decoration: InputDecoration(
  //                   hintText: 'Enter District',
  //                   filled: true,
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                 ),
  //               ),
  //////////////////////////////////////////////////////////////////////////////
   // 
                                                    // setState(() {s
                                                  //     isLoading = true;
                                                  //   });

                                                  //   isLoading = true
                                                  //       ? Navigator.of(context)
                                                  //           .push(MaterialPageRoute(
                                                  //               builder:
                                                  //                   ((context) =>
                                                  //                       const LoadingIndicator())))
                                                  //       : Container();
                                                  //   Future.delayed(
                                                  //       const Duration(
                                                  //           seconds: 3), () {
                                                  //     setState(() {
                                                  //       isLoading = false;
                                                  //     });
                                                  //     Navigator.of(context).push(
                                                  //         MaterialPageRoute(
                                                  //             builder: ((context) =>
                                                  //                 const ComplaintListScreen())));
                                                  //   });
                                                  // },



                                                  // class MySearchDelegate extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     IconButton(
//       onPressed: () {
//         if (query.isEmpty) {
//           close(context, null);
//         } else {
//           query = "";
//         }
//       },
//       icon: Icon(Icons.clear),
//     );
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: const Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String>suggestion=[
//       ""
//     ]
//     throw UnimplementedError();
//   }
// }
//  Get.defaultDialog(
//                                               title: "Delete Complent",
//                                               content: const Text(
//                                                   "Do you want delete your complant"),
//                                               actions: [
//                                                 ElevatedButton.icon(
//                                                     icon: const Icon(
//                                                         Icons.delete),
//                                                     label: const Text("Delete"),
//                                                     onPressed: () {}),
//                                                 ElevatedButton.icon(
//                                                   icon:
//                                                       const Icon(Icons.cancel),
//                                                   label: const Text("Delete"),
//                                                   onPressed: () {
//                                                     Navigator.of(context).pop();
//                                                   },
//                                                 )
//                                               ]);

                                          // user.
                                          // Navigator.of(context).pop();
                                          // const SizedBox(
                //   height: 20,
                // ),

                // Container(
                //   decoration: BoxDecoration(
                //       border: Border.all(),
                //       borderRadius: BorderRadius.circular(10)),
                //   width: 400,
                //   height: 200,
                //   child: storedFiles != null
                //       ? viewFilePage()
                //       : Container(
                //           child: const Text(
                //             "",
                //             textAlign: TextAlign.center,
                //             style: TextStyle(fontSize: 20),
                //           ),
                //         ),
                // ),
  // Container(
  //               child: ElevatedButton.icon(
  //                 onPressed: pickMultipleFiles,
  //                 icon: const Icon(Icons.image),
  //                 label: const Text("Select file"),
  //               ),
  //             ),
   // latitudeController.text = locData;
    // longitudeController.text = locData.longitude.toString();
    // latitude = latitudeController as double;
    // longitude = longitudeController as double;
     // filtred = complaintData!.where(
    //   (fil) {
    //     return filtred.contains(fil["id"]);
    //   },
    // ).toList();

    // filtred.add(complaintData);

    // //
    // filtred.retainWhere(
    //   (element) => element[1],
    // );

    // print("filtred:$filtredCno");

    // List fil2 = filtredCno.where(
    //     (element) => filtredCno.contains(element["data"]["data"][1]["cno"]));
    // print(fil2);

    // filtredCno=complaintData.where((data){
    //   return ['cno'];

    // })

    // result["data"]["cno"].forEach((val) {
    //   print(val);
    // });

    // result['data']["cno"]
    //       .map((data) => GetComplaintData.fromJson(data))
    //       .toList()
    //       .cast<GetComplaintData>(),
    // );

    // print(filtredCno);

    // res.addAll(complaintData!);

    // res.where((element) {
    //   return element.contains("cno");
    // }).toList();
    // res.forEach((val) {
    //   print(val);
    // });

    // res.retainWhere((cno) {
    //   return ("cno".toLowerCase());
    // });
    // print(res);
     // print(result);

    // filtred = result["data"]["data"].where(
    //   (fil) => result["data"]["data"].contains(fil["cno"]),
    // );
