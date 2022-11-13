part of 'menu_bloc.dart';

@immutable
class MenuState {
  final List<Item> foods;
  final List<Item> sideDishes;

  const MenuState({
    this.foods = const <Item>[],
    this.sideDishes = const <Item>[],
  });

  const MenuState.initial() : this(foods: const <Item>[]);

  MenuState copyWith({
    List<Item>? foods,
    List<Item>? sideDishes,
  }) {
    return MenuState(
      foods: foods ?? this.foods,
      sideDishes: sideDishes ?? this.sideDishes,
    );
  }
}
