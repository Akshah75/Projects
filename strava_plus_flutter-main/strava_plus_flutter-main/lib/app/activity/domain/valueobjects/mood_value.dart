import 'package:dartz/dartz.dart';
import 'package:mobile_polimi_project/app/activity/domain/valueobjects/range_value.dart';

class MoodValue extends RangeValue {
  factory MoodValue(int value) => MoodValue._(RangeValue.factory(value));
  const MoodValue._(Option<int> value) : super(value);

  @override
  Map<int, String> get messages => {
        1: 'Bad',
        2: 'Not good',
        3: 'Normal',
        4: 'High',
        5: 'Really high',
      };
}
