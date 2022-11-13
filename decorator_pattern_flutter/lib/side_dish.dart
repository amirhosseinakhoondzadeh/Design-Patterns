import 'package:decorator_pattern_flutter/meal.dart';

abstract class SideDish extends Meal {
  final Meal meal;
  SideDish({required this.meal});
}
