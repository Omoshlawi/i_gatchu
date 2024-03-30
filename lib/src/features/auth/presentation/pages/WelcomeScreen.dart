import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:i_gatchu/src/shared/display/Logo.dart';
import 'package:i_gatchu/src/shared/input/Button.dart';
import 'package:i_gatchu/src/shared/layouts/ResponsiveWidgetFormLayout.dart';
import 'package:i_gatchu/src/utils/constants.dart';
import 'package:i_gatchu/src/utils/routes.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: ResponsiveWidgetFormLayout(
        buildPageContent: (BuildContext context, Color? bgCollor) => Container(
          padding: const EdgeInsets.all(Constants.SPACING * 4),
          decoration: BoxDecoration(
            color: bgCollor,
            borderRadius: BorderRadius.circular(Constants.ROUNDNESS),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Logo(),
              ),
              const SizedBox(height: Constants.SPACING),
              const Text(
                "I gatchu 👊",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: Constants.SPACING),
              Text(
                "Access emergency services at, \nthe palm of your hand.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onTertiaryContainer,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Constants.SPACING),
              const Text(
                "Let's you in",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: Constants.SPACING),
              Button(
                title: "Login",
                onPress: () => context.goNamed(RouteNames.LOGIN_SCREEN),
              ),
              const SizedBox(height: 20),
              Button(
                title: "Register",
                onPress: () => context.goNamed(RouteNames.REGISTER_SCREEN),
              ),
              const SizedBox(height: Constants.SPACING),
              const SizedBox(height: Constants.SPACING),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 2,
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  const Text(
                    "Or continue with",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 2,
                        color: theme.colorScheme.outline),
                  ),
                ],
              ),
              const SizedBox(height: Constants.SPACING),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: theme.colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(Constants.ROUNDNESS),
                    ),
                    child: IconButton(
                      onPressed: () async {
                        final uri = Uri.parse("${Constants.BASE_URL}/auth/google");
                        final result = await FlutterWebAuth2.authenticate(url: uri.toString(),callbackUrlScheme: "http");
                        debugPrint("**********************$result");
                      },
                      icon: SvgPicture.asset("assets/images/google.svg", width: 20,height: 20,),
                    ),
                  ),
                  const SizedBox(width: Constants.SPACING),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: theme.colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(Constants.ROUNDNESS),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.apple, size: 30),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
