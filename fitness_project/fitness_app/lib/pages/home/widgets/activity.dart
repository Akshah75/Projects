import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  String? name;
  var mTime;
  var distance;

  @override
  Widget build(BuildContext context) {
    // List<HealthDataPoint> _healthDataList = [];
    // int _nofSteps = 10;
    // String totalsteps;

    // // create a HealthFactory for use in the app
    // HealthFactory health = HealthFactory();

    // /// Fetch data points from the health plugin and show them in the app.
    // Future fetchData() async {
    //   // define the types to get
    //   final types = [
    //     HealthDataType.STEPS,
    //   ];

    //   // with coresponsing permissions
    //   final permissions = [
    //     HealthDataAccess.READ,
    //   ];

    //   // get data within the last 24 hours
    //   final now = DateTime.now();
    //   // final endTime = now.add(const Duration(hours: ));
    //   final yesterday = now.subtract(const Duration(days: 1));
    //   final dayaftr = now.subtract(const Duration(days: 2));
    //   final aftre = now.subtract(const Duration(days: 3));
    //   print(dayaftr);
    //   // final result = dayaftr.subtract(Duration(days: 2));
    //   // print(result);
    //   // requesting access to the data types before reading them
    //   // note that strictly speaking, the [permissions] are not
    //   // needed, since we only want READ access.
    //   bool requested =
    //       await health.requestAuthorization(types, permissions: permissions);
    //   print('requested: $requested');

    //   // If we are trying to read Step Count, Workout, Sleep or other data that requires
    //   // the ACTIVITY_RECOGNITION permission, we need to request the permission first.
    //   // This requires a special request authorization call.
    //   //
    //   // The location permission is requested for Workouts using the Distance information.
    //   await Permission.activityRecognition.request();
    //   await Permission.location.request();

    //   if (requested) {
    //     try {
    //       // fetch health data
    //       List<HealthDataPoint> healthData =
    //           await health.getHealthDataFromTypes(yesterday, now, types);

    //       final totalsteps =
    //           (await health.getTotalStepsInInterval(dayaftr, yesterday));

    //       //

    //       print("Step:$totalsteps");

    //       // save all the new data points (only the first 100)
    //       _healthDataList.addAll(
    //           (healthData.length < 2) ? healthData : healthData.sublist(0, 2));
    //     } catch (error) {
    //       print("Exception in getHealthDataFromTypes: $error");
    //     }

    //     // filter out duplicates
    //     _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

    //     // print the results
    //     _healthDataList.forEach((x) => print(x));

    //     // update the UI to display the results

    //   } else {
    //     print("Authorization not granted");
    //   }
    // }

    //
    return Expanded(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey.shade100,
            child: name != null
                ? Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Activity Name:$name"),
                        const SizedBox(
                          height: 2,
                        ),
                        Text("Time:$mTime"),
                        const SizedBox(
                          height: 2,
                        ),
                        Text("Distance:$distance"),
                      ],
                    ),
                  )
                : Container(),
          ),
          ElevatedButton(
            onPressed: authorize,
            child: const Text("Strava data"),
          )
        ],
      ),
    );
  }

  //
  Future<void> authorize() async {
    const urls =
        "https://www.strava.com/oauth/mobile/authorize?client_id=95381&response_type=code&redirect_uri=http://localhost/exchange_token&approval_prompt=force&scope=activity:read_all";

    final url = Uri.parse(urls);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token'
    });
    print(response);
    // final result = json.decode(response.body);
    // print(result);
  }

  //

  Future<void> getData2() async {
    const token = "ff514a12d8dde5b14ddafde41629a6b6b700ed4c";
    const urls = "https://www.strava.com/api/v3/athlete/activities";
    final url = Uri.parse(urls);
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      print(response);
      final result = json.decode(response.body);
      print(result);
      //
      final name2 = result[0]["name"];
      final distances = result[0]["distance"];
      final movingTime = result[0]["moving_time"];
      setState(() {
        name = name2;
        distance = distances;
        mTime = movingTime;
      });
      print(name);
      print(response);
    } catch (error) {
      throw (error);
    }
    //
  }

  Future<void> getData() async {
    // create a HealthFactory for use in the app
    HealthFactory health = HealthFactory();

    // define the types to get
    var types = [
      HealthDataType.STEPS,
      // HealthDataType.BLOOD_GLUCOSE,
    ];

    // requesting access to the data types before reading them
    bool requested = await health.requestAuthorization(types);
    print(requested);

    var now = DateTime.now();

    // fetch health data from the last 24 hours
    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        now.subtract(
          const Duration(days: 1),
        ),
        now,
        types);

    print(healthData);

    // request permissions to write steps and blood glucose
    types = [HealthDataType.STEPS]; //HealthDataType.BLOOD_GLUCOSE
    var permissions = [
      HealthDataAccess.READ_WRITE,
      // HealthDataAccess.READ_WRITE
    ];
    await health.requestAuthorization(types, permissions: permissions);

    // write steps and blood glucose
    bool success =
        await health.writeHealthData(10, HealthDataType.STEPS, now, now);
    // success = await health.writeHealthData(
    //     3.1, HealthDataType.BLOOD_GLUCOSE, now, now);

    // get the number of steps for today
    var midnight = DateTime(now.year, now.month, now.day);
    print(midnight);
    int? steps = await health.getTotalStepsInInterval(midnight, now);
    print(steps);
  }
}
