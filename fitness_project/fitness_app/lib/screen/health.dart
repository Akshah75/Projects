import 'package:flutter/material.dart';
import 'package:health/health.dart';

//
class HealthData extends StatefulWidget {
  const HealthData({
    Key? key,
  }) : super(key: key);

  @override
  State<HealthData> createState() => _HealthDataState();
}

class _HealthDataState extends State<HealthData> {
  int? step2;
  HealthFactory health = HealthFactory();
  Future data() async {
    var types = [HealthDataType.STEPS];
    var now = DateTime.now();
    print(now);
    //
    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        now.subtract(const Duration(days: 1)), now, types);
    print(healthData);

    types = [HealthDataType.STEPS];
    var permissions = [
      HealthDataAccess.READ_WRITE,
    ];
    await health.requestAuthorization(types, permissions: permissions);
    bool success =
        await health.writeHealthData(10, HealthDataType.STEPS, now, now);

    print(success);
    var midnight = DateTime(now.year, now.month, now.day);
    int? steps = await health.getTotalStepsInInterval(midnight, now);
    print(steps);
    setState(() {
      step2 = steps;
    });
  }

  // Fetch steps from the health plugin and show
  Future fetchStepData() async {
    int? steps;
    //get step for today.
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    //
    bool req = await health.requestAuthorization([HealthDataType.STEPS]);

    if (req) {
      steps = await health.getTotalStepsInInterval(midnight, now);
      print(steps);
    }
  }

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("helth data"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: fetchStepData,
          child: step2 == null
              ? const Text("get Data")
              : Text("Your total Step is :$step2"),
        ),
      ),
    );
  }
}
