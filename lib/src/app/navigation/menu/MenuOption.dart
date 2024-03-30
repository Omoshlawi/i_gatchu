import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? iconSize;
  final Color? iconColor;
  final Color? bgColor;
  final void Function()? onPress;

  const MenuOption({
    super.key,
    required this.title,
    required this.icon,
    this.padding,
    this.margin,
    this.iconSize,
    this.iconColor,
    this.bgColor,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: padding,
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: onPress,
            backgroundColor: bgColor,
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
