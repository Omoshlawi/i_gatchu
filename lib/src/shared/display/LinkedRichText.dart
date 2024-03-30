import 'package:flutter/material.dart';

class LinkedRichText extends StatelessWidget {
  final String linked;
  final String unlinked;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;
  final void Function()? onPress;
  final TextStyle? unlinkedStyle;
  final TextStyle? linkedStyle;

  const LinkedRichText({
    super.key,
    this.onPress,
    required this.linked,
    required this.unlinked,
    this.spacing = 2,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.unlinkedStyle,
    this.linkedStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          linked,
          style: linkedStyle,
        ),
        SizedBox(
          height: spacing,
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            unlinked,
            style: unlinkedStyle != null
                ? unlinkedStyle?.copyWith(color: theme.colorScheme.primary)
                : TextStyle(
                    color: theme.colorScheme.primary,
                  ),
          ),
        )
      ],
    );
  }
}
