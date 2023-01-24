import 'dart:math';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

class Steps extends StatefulWidget {
  const Steps({Key? key}) : super(key: key);

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  int? step2;
  HealthFactory health = HealthFactory();
  Future data() async {
    var types = [HealthDataType.STEPS];
    var now = DateTime.now();
    print(now);
    //
    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        now.subtract(
          const Duration(days: 1),
        ),
        now,
        types);
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
    setState(
      () {
        step2 = steps;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    data();
    fetchStepData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          step2 != null
              ? Text(
                  "$step2",
                  style: const TextStyle(
                      fontSize: 33, fontWeight: FontWeight.w900),
                )
              : Container(),
          const Text(
            "Total Steps",
            style:
                TextStyle(fontSize: 11, fontWeight: FontWeight.w500, height: 2),
          ),
        ],
      ),
    );
  }

  Future fetchStepData() async {
    int? steps;
    final _nofSteps;

    //get step for today.
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);
    final earlier = now.subtract(
      const Duration(minutes: 20),
    );

//
    _nofSteps = Random().nextInt(10);
    bool success = await health.writeHealthData(
        _nofSteps.toDouble(), HealthDataType.STEPS, earlier, now);
    print(success);
    //
    bool req = await health.requestAuthorization(
      [HealthDataType.STEPS],
    );

    if (req) {
      steps = await health.getTotalStepsInInterval(midnight, now);
      print(steps);
    }
  }
}
