class Item {
  final int id;
  final String name;
  final String imageName;
  final bool isSelected;

  Item copyWith({bool? isSelected}) {
    return Item(
      id: id,
      name: name,
      imageName: imageName,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  const Item({
    required this.id,
    required this.name,
    required this.imageName,
    this.isSelected = false,
  });
}
