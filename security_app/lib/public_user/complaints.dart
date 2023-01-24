import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:security_app/Authentication/login_data.dart';
import 'package:security_app/SuperAdmin/file_show.dart';
import 'package:security_app/SuperAdmin/show_file_widget.dart';
import 'package:security_app/constent.dart';
import 'package:security_app/public_user/public_drawer.dart';
import 'package:security_app/splashScreen/imageList.dart';
import 'package:security_app/splashScreen/loading.dart';
import '../image_upload/image.dart';
import 'package:location/location.dart';
import 'complaint_list_screen.dart';
import 'home.dart';

class Complaints extends StatefulWidget {
  const Complaints({Key? key}) : super(key: key);

  @override
  State<Complaints> createState() => _ComplaintsState();
  static const routeName = '/complaint';
}

class _ComplaintsState extends State<Complaints> {
  File? storedImage;
  List<File>? storedFiles; //imp
  FilePickerResult? results;
  String? selectedValue;
  List typeOfOwner = ['new'];
  Map owner = {"1": "Government", "2": "Non-Government"};
  double? latitude;
  double? longitude;
  List<File> newFile = [];
  bool? showfile = false;
  bool isloading = false;

  // String? owner;
  //
  final controller = TextEditingController();
  final talukaController = TextEditingController();
  final localityController = TextEditingController();
  final ctsController = TextEditingController();
  final surveyController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final descriptionController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileNoController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final districtController = TextEditingController();
  String? ownerController;

  final formKey = GlobalKey<FormState>();

  List<String> district = [
    'Thane',
    'MumbaiCity',
    'Mumbai Suburbun',
    'Ratnagiri',
    'Sindhudurg',
    'Raigad',
    'Palghar',
  ];
  @override
  void initState() {
    super.initState();
    getCurrentUserLocation();
    owenershiptype();
  }

  void validateForm() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    print('Form Submitted');
    if (results!.files != null) {
      fileUpload(results!.files);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const LoadingIndicator()));
      setState(() {
        isloading = true;
      });
      complaintListPage();
    } else {
      const snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'file is requred',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  //
  Future<void> complaintListPage() async {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isloading = false;
      });
      isloading
          ? const LoadingIndicator()
          : Navigator.of(context).pushNamedAndRemoveUntil(
              ComplaintListScreen.routeName, (route) => false);
      ;
    });
  }

//
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        drawer: const PublicDrawer(),
        appBar: AppBar(
          actions: [
            Container(
              margin: const EdgeInsets.all(10),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeUserScreen()));
                  },
                  child: const Icon(Icons.home)),
            )
          ],
          title: const Text('Complaint'),
        ),
        body:
            // padding: const EdgeInsets.all(5),

            Form(
          //auto validation
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: const Text(
                          '*Application Details',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    if (val != null && val.length < 2) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Nature of Complaint',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  controller: districtController,
                  decoration: InputDecoration(
                    hintText: 'Entre District',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: talukaController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Enter Taluka',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: localityController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Locality / Landmark',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  // validator: (val) {
                  //   if (val == null) {
                  //     return 'Requred';
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  decoration: InputDecoration(
                    hintText: 'Type Of Mangroves By Ownership',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: owner
                      .map((key, value) {
                        return MapEntry(
                            key,
                            DropdownMenuItem(
                              value: key,
                              child: Text(value),
                            ));
                        print(key);
                      })
                      .values
                      .toList(),

                  //    typeOfOwner.map((e) {
                  //     return DropdownMenuItem(
                  //       value: e,
                  //       child: Text(' $e'),
                  //     );
                  //   }).toList(),

                  onChanged: (val) {
                    print(val);
                    ownerController = val as String;
                    print(ownerController);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: ctsController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'C.T.S No',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: surveyController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Survey No',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  readOnly: true,
                  // initialValue: value,
                  controller: latitudeController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Latitude',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  readOnly: true,
                  // initialValue: latitude.toString(),
                  controller: longitudeController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Latitude',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: descriptionController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  maxLength: 150,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      // style: ElevatedButton.styleFrom(
                      //   fixedSize: const Size(300, 45),
                      // ),
                      onPressed: pickMultipleFiles,
                      icon: const Icon(Icons.image),
                      label: const Text("Select file"),
                    ),
                    ElevatedButton.icon(
                      // style: ElevatedButton.styleFrom(
                      //   fixedSize: const Size(300, 45),
                      // ),
                      onPressed: () {
                        print("work");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => results!.files != null
                                ? ShowFile(files: results!.files)
                                : Container()),
                          ),
                        );
                      },
                      icon: const Icon(Icons.image),
                      label: const Text("Check your file"),
                    ),
                  ],
                ),
                // SingleChildScrollView(
                //   child: Container(
                //     padding: const EdgeInsets.all(40),
                //     child: Column(
                //       children: [
                //         ListView.builder(
                //             itemCount: 1,
                //             itemBuilder: (context, index) {
                //               return Container();
                //             })
                //       ],
                //     ),
                //   ),
                // ),

                // ShowFile(
                //   files: results!.files,
                // ),

                // Container(
                //   padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       ListView.builder(
                //         itemCount: 1,
                //         itemBuilder: (context, index) {
                //           return const ListTile(
                //             title: Text("new"),
                //           );
                //         },
                //       ),
                //     ],
                //   ),
                // ),

////////////////////////////////////////////////////////////////////////////////
                const SizedBox(
                  height: 20,
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Applicants Details',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: firstNameController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: lastNameController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: mobileNoController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Mobile No',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: addressController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  maxLength: 150,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      getCurrentUserLocation();
                      setState(() {});

                      validateForm();
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // user location//
  Future<void> getCurrentUserLocation() async {
    try {
      final locData = await Location().getLocation();
      Location().onLocationChanged.listen((event) {
        longitudeController.text = locData.longitude.toString();
        latitudeController.text = locData.latitude.toString();
      });

      print(locData.latitude);
      print(locData.longitude);
    } catch (e) {
      print("Could not get the location $e");
    }
  }

  //////////////////////////////////////////////////////////////////////////////
// pick multiple file//
  void pickMultipleFiles() async {
    print("work file?");
    results = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.any);
    if (results == null) return;
    fileUpload(results!.files);
    // selectedFile(results!.files);

    print(storedFiles);
  }

  // void selectedFile(List<PlatformFile> files) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: ((context) => ShowFile(
  //             files: files,
  //           )),
  //     ),
  //   );
//   }

////////////////////////////////////////////////////////////////////////////////
  Future<void> fileUpload(List<PlatformFile> files) async {
    print(files);
    String token = await getToken();
    print(token);
    // ignore: avoid_print
    print("working??");
    const url = '${basedUrl}testing';
    // ignore: avoid_print
    print(url);
    //crete arry
    Map<String, String> head = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    //
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(url));

    request.headers.addAll(head);

    print(request);
    //
    List<http.MultipartFile> newFiles = [];
    //for loop
    for (var img in files) {
      if (img != null) {
        var multiFile = await http.MultipartFile.fromPath(
          "complaintfile[]",
          File(img.path as String).path,
        );
        newFiles.add(multiFile);
      }
    }
    request.files.addAll(newFiles);
    request.fields['nature'] = controller.text;
    request.fields['district'] = districtController.text;
    request.fields['taluka'] = talukaController.text;
    request.fields['landmark'] = localityController.text;
    request.fields['ownership_type'] = ownerController!;
    request.fields['cts_no'] = ctsController.text;
    request.fields['survey_no'] = surveyController.text;
    request.fields['latitude'] = latitudeController.text;
    request.fields['longitude'] = longitudeController.text;
    request.fields['description'] = descriptionController.text;
    request.fields['firstname'] = firstNameController.text;
    request.fields['lastname'] = lastNameController.text;
    request.fields['primarycontact'] = mobileNoController.text;
    var response = await request.send().catchError((onError) => print(onError));

    print(response.toString());
    response.stream.transform(utf8.decoder).listen((value) {
      print('value');
      print(value);
    });
  }

  /////////////////////////////////////////////////////////////////////////////
  //ownershiptype//
  void owenershiptype() async {
    print("work");
    String token = await getToken();
    final url = Uri.parse('${basedUrl}ownershiptype');
    final res = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    final responseData = jsonDecode(res.body);
    // print(responseData);

    owner = responseData['data'];

    owner.forEach(
      (key, value) {
        print('it');
        print(key);
        print(value);
        owner[key] = value;
      },
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
Widget buildListTile(PlatformFile file) {
  return ListTile(
    title: Text(
      file.path!.split('/').last,
    ),
  );
}
