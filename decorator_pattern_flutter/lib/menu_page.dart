import 'package:decorator_pattern_flutter/bloc/menu_bloc.dart';
import 'package:decorator_pattern_flutter/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Menu"),
      ),
      body: BlocProvider(
        create: (_) => MenuBloc()..add(MenuPageCreatedEvent()),
        child: BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoolList(
                    items: state.foods,
                    onTap: (food) {
                      context
                          .read<MenuBloc>()
                          .add(FoodChangedEvent(item: food));
                    },
                  ),
                  const SizedBox(height: 24),
                  if (state.foods.length == 1) ...{
                    FoolList(
                      items: state.sideDishes,
                      onTap: (food) {
                        context
                            .read<MenuBloc>()
                            .add(SideDishChangedEvent(item: food));
                      },
                    ),
                    const SizedBox(height: 24),
                  },
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:
                        Text(context.read<MenuBloc>().meal?.description ?? ""),
                  ),
                  Container(
                    height: 1,
                    margin: const EdgeInsets.all(16),
                    color: Colors.lightGreen,
                  ),
                  Center(
                      child: Text(
                          "Total : ${context.read<MenuBloc>().meal?.cost() ?? 0.0}€"))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class FoolList extends StatelessWidget {
  final ValueSetter<Item> onTap;
  final List<Item> items;
  const FoolList({
    required this.items,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: ((context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.all(8),
          leading: Image.asset(
            items[index].imageName,
            width: 60,
            height: 60,
          ),
          title: Text(items[index].name),
          trailing: items[index].isSelected
              ? const Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : null,
          onTap: () => onTap(items[index]),
        );
      }),
      separatorBuilder: (context, index) => Container(
        color: Colors.grey,
        height: 1,
      ),
    );
  }
}
