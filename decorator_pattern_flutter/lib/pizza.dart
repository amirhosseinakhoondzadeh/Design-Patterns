import 'package:decorator_pattern_flutter/meal.dart';

class Pizza extends Meal {
  @override
  String get description => "Pizza";
  @override
  double cost() {
    return 8.50;
  }
}
