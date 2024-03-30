import 'package:flutter/material.dart';
import 'package:i_gatchu/src/shared/input/Search.dart';
import 'package:i_gatchu/src/utils/constants.dart';

class Greetings2 extends StatelessWidget {
  final String? image;
  final String name;

  const Greetings2({super.key, this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final headerHeight = screenSize.height * 0.1;
    final radius = screenSize.width * 0.12;

    return Container(
      margin: EdgeInsets.only(bottom: headerHeight * 0.5),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: headerHeight,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),

            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Constants.SPACING * 2),
              child: Text(
                "Welcome $name 👋",
                style: TextStyle(fontSize: 20, color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            bottom: -(headerHeight * 0.35),
            height: headerHeight * 0.7,
            width: screenSize.width * 0.75,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: theme.colorScheme.onPrimary,
                borderRadius: BorderRadius.all(
                  Radius.circular(radius),
                ),
              ),
              child: const Center(child: Search()),
            ),
          ),
        ],
      ),
    );
  }
}
