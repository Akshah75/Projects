import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

//
class ShowDats extends StatefulWidget {
  const ShowDats({Key? key}) : super(key: key);

  @override
  State<ShowDats> createState() => _ShowDatsState();
}

class _ShowDatsState extends State<ShowDats> {
  @override
  Widget build(BuildContext context) {
    List<HealthDataPoint> _healthDataList = [];
    int _nofSteps = 10;
    var totalsteps;
    var totalstepsday1;

    // create a HealthFactory for use in the app
    HealthFactory health = HealthFactory();

    /// Fetch data points from the health plugin and show them in the app.
    Future fetchData() async {
      // define the types to get
      final types = [
        HealthDataType.STEPS,
      ];

      // with coresponsing permissions
      final permissions = [
        HealthDataAccess.READ,
      ];

      // get data within the last 24 hours
      final now = DateTime.now();
      final now2 = DateTime.parse("2022-10-12");
      // final endTime = now.add(const Duration(hours: ));
      final yesterday = now.subtract(
        const Duration(days: 1),
      );
      final dayaftr = now2.subtract(
        const Duration(days: 2),
      );
      final aftre = now.subtract(
        const Duration(days: 3),
      );
      print(dayaftr);
      // final result = dayaftr.subtract(Duration(days: 2));
      // print(result);
      // requesting access to the data types before reading them
      // note that strictly speaking, the [permissions] are not
      // needed, since we only want READ access.
      bool requested =
          await health.requestAuthorization(types, permissions: permissions);
      print('requested: $requested');

      // If we are trying to read Step Count, Workout, Sleep or other data that requires
      // the ACTIVITY_RECOGNITION permission, we need to request the permission first.
      // This requires a special request authorization call.
      //
      // The location permission is requested for Workouts using the Distance information.
      await Permission.activityRecognition.request();
      await Permission.location.request();

      if (requested) {
        try {
          // fetch health data
          List<HealthDataPoint> healthData =
              await health.getHealthDataFromTypes(yesterday, now, types);

          final totalsteps =
              (await health.getTotalStepsInInterval(dayaftr, yesterday));
          final totalstepss =
              (await health.getTotalStepsInInterval(aftre, dayaftr));

          //

          print("Step:$totalsteps");
          print("Ste2:$totalstepss");

          // save all the new data points (only the first 100)
          _healthDataList.addAll(
              (healthData.length < 2) ? healthData : healthData.sublist(0, 2));
        } catch (error) {
          print("Exception in getHealthDataFromTypes: $error");
        }

        // filter out duplicates
        _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

        // print the results
        _healthDataList.forEach((x) => print(x));

        // update the UI to display the results

      } else {
        print("Authorization not granted");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("show data"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: fetchData,
            child: const Text("new"),
          ),
          const Text("123")
        ],
      ),
    );
  }
}
