import 'package:flutter/material.dart';
import 'package:i_gatchu/src/utils/constants.dart';

class ResponsiveWidgetFormLayout extends StatelessWidget {
  final Widget Function(BuildContext, Color?) buildPageContent;

  const ResponsiveWidgetFormLayout({super.key, required this.buildPageContent});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraint) {
        Color? color;
        if (constraint.maxWidth > Constants.MEDIUM_SCREEN_WIDTH) {
          color = theme.colorScheme.onPrimary;
        }
        // Large screen
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Constants.MEDIUM_SCREEN_WIDTH,
              maxHeight: screenSize.height,
            ),
            child: SingleChildScrollView(
              child: buildPageContent(context, color),
            ),
          ),
        );
      },
    );
  }
}
