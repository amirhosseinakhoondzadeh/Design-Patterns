import 'package:decorator_pattern_flutter/meal.dart';
import 'package:decorator_pattern_flutter/side_dish.dart';

class Salad extends SideDish {
  Salad({required Meal meal}) : super(meal: meal);

  @override
  String get description => "${meal.description}\nSalad";

  @override
  double cost() {
    return meal.cost() + 3.50;
  }
}
