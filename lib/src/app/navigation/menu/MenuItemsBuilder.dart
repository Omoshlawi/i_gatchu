import 'package:flutter/material.dart';
import 'package:i_gatchu/src/app/navigation/menu/menuItems.dart';

class MenuItemsBuilder extends StatelessWidget {
  final Widget Function(MenuItem item) itemBuilder;
  final List<MenuItem> items;
  final int crossAxisCount;

  const MenuItemsBuilder({
    super.key,
    required this.itemBuilder,
    required this.items,
    this.crossAxisCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int currentIndex) {
          return itemBuilder(items[currentIndex]);
        },
      ),
    );
  }
}
