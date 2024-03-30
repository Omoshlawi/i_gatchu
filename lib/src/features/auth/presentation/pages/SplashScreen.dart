import 'package:flutter/material.dart';
import 'package:i_gatchu/src/shared/display/Logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(child: Container()),
        const Logo(),
        const Text(
          "I gatchu 👊",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        Text(
          "Access emergency services at, \nthe palm of your hand.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
          textAlign: TextAlign.center,
        ),
        Expanded(child: Container()),
        CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 20,)
      ],
    ));
  }
}
