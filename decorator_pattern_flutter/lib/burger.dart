import 'package:decorator_pattern_flutter/meal.dart';

class Burger extends Meal {
  @override
  String get description => "Burger";

  @override
  double cost() {
    return 6.0;
  }
}
