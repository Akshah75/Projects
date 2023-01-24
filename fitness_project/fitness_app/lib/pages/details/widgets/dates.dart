import 'package:fitness_app/widgets/helper.dart';
import 'package:flutter/material.dart';

class Dates extends StatelessWidget {
  const Dates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DateBox> dateBoxes = [];
    //
    // DateTime date = DateTime.parse("2022-10-10");
    DateTime date = DateTime.now().subtract(
      const Duration(days: 5),
    );

    for (int i = 0; i < 6; i++) {
      dateBoxes.add(
        DateBox(
          date: date,
          active: i == 5,
        ),
      );
      date = date.add(
        const Duration(days: 1),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: GestureDetector(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: dateBoxes),
      ),
    );
  }
}

class DateBox extends StatelessWidget {
  final bool active;
  final DateTime date;

  const DateBox({this.active = false, required this.date, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (date.day == 7) {
          print("working");
        }
        if (date.day == 8) {
          print("working");
        }

        //
      },
      child: Container(
        width: 50,
        height: 70,
        decoration: BoxDecoration(
          gradient: active
              ? const LinearGradient(colors: [
                  Color(0xff92e2ff),
                  Color(0xff1ebdf8),
                ], begin: Alignment.topCenter)
              : null,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xffe1e1e1),
          ),
        ),
        child: DefaultTextStyle.merge(
          style: active ? const TextStyle(color: Colors.white) : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                daysOfWeek[date.weekday]!,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${date.day}",
                style:
                    const TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
