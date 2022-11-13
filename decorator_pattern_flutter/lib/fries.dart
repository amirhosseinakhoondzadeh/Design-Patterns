import 'package:decorator_pattern_flutter/meal.dart';
import 'package:decorator_pattern_flutter/side_dish.dart';

class Fries extends SideDish {
  Fries({required Meal meal}) : super(meal: meal);

  @override
  String get description => "${meal.description}\nFries";

  @override
  double cost() {
    return meal.cost() + 4.50;
  }
}
