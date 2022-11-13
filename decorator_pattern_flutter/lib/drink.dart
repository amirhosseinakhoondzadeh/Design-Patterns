import 'package:decorator_pattern_flutter/meal.dart';
import 'package:decorator_pattern_flutter/side_dish.dart';

class Drink extends SideDish {
  Drink({required Meal meal}) : super(meal: meal);

  @override
  String get description => "${meal.description}\nDrink";

  @override
  double cost() {
    return meal.cost() + 2.50;
  }
}
