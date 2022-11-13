import 'package:decorator_pattern_flutter/meal.dart';

class HotDog extends Meal {
  @override
  String get description => "Hot Dog";

  @override
  double cost() {
    return 4.20;
  }
}
