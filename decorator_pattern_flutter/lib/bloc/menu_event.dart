part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent {}

class MenuPageCreatedEvent extends MenuEvent {}

class SideDishChangedEvent extends MenuEvent {
  final Item item;
  SideDishChangedEvent({required this.item});
}

class FoodChangedEvent extends MenuEvent {
  final Item item;
  FoodChangedEvent({required this.item});
}
