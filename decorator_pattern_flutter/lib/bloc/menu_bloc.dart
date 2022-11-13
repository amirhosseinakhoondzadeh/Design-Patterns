import 'dart:async';

import 'package:decorator_pattern_flutter/burger.dart';
import 'package:decorator_pattern_flutter/drink.dart';
import 'package:decorator_pattern_flutter/fries.dart';
import 'package:decorator_pattern_flutter/hot_dog.dart';
import 'package:decorator_pattern_flutter/item.dart';
import 'package:decorator_pattern_flutter/meal.dart';
import 'package:decorator_pattern_flutter/pizza.dart';
import 'package:decorator_pattern_flutter/salad.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  Meal? meal;

  MenuBloc() : super(const MenuState.initial()) {
    on<MenuPageCreatedEvent>(_onMenuPageCreatedEvent);
    on<FoodChangedEvent>(_onFoodChangedEvent);
    on<SideDishChangedEvent>(_onSideDishChangedEvent);
  }

  FutureOr<void> _onMenuPageCreatedEvent(
    MenuPageCreatedEvent event,
    Emitter<MenuState> emit,
  ) {
    final foods = <Item>[
      const Item(id: 1, name: "Pizza", imageName: "assets/images/pizza.png"),
      const Item(id: 2, name: "Hot Dog", imageName: "assets/images/hotdog.png"),
      const Item(id: 3, name: "Burger", imageName: "assets/images/burger.png"),
    ];
    final sideDishes = <Item>[
      const Item(id: 1, name: "Fries", imageName: "assets/images/fries.png"),
      const Item(id: 2, name: "Salad", imageName: "assets/images/salad.png"),
      const Item(id: 3, name: "Drink", imageName: "assets/images/drink.png"),
    ];
    emit(state.copyWith(foods: foods, sideDishes: sideDishes));
  }

  FutureOr<void> _onFoodChangedEvent(
    FoodChangedEvent event,
    Emitter<MenuState> emit,
  ) {
    switch (event.item.id) {
      case 1:
        meal = Pizza();
        break;
      case 2:
        meal = HotDog();
        break;
      case 3:
        meal = Burger();
        break;
    }

    final foods = state.foods;
    foods.retainWhere(
      (element) => element.id == event.item.id,
    );

    emit(state.copyWith(foods: foods));
  }

  FutureOr<void> _onSideDishChangedEvent(
    SideDishChangedEvent event,
    Emitter<MenuState> emit,
  ) {
    if (!event.item.isSelected) {
      List<Item> sideDishes = state.sideDishes;

      switch (event.item.id) {
        case 1:
          meal = Fries(meal: meal!);
          sideDishes[0] = event.item.copyWith(isSelected: true);
          break;
        case 2:
          meal = Salad(meal: meal!);
          sideDishes[1] = event.item.copyWith(isSelected: true);
          break;
        case 3:
          meal = Drink(meal: meal!);
          sideDishes[2] = event.item.copyWith(isSelected: true);
          break;
      }

      emit(state.copyWith(sideDishes: sideDishes));
    }
  }
}
