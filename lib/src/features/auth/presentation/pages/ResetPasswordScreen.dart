import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:i_gatchu/src/shared/display/LinkedRichText.dart';
import 'package:i_gatchu/src/shared/input/Button.dart';
import 'package:i_gatchu/src/shared/input/FormInputTextField.dart';
import 'package:i_gatchu/src/shared/layouts/ResponsiveWidgetFormLayout.dart';
import 'package:i_gatchu/src/utils/constants.dart';
import 'package:i_gatchu/src/utils/routes.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  var username = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        void handleSubmit() async {
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a snack-bar. In the real world,
            // you'd often call a server or save the information in a database.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login successfully!,')),
            );
            final credentials = {
              "username": username.text,
              "password": password.text
            };
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Reset password"),
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.chevron_left),
            ),
          ),
          body: ResponsiveWidgetFormLayout(
            buildPageContent: (context, color) => SafeArea(
              child: Container(
                padding: const EdgeInsets.all(Constants.SPACING * 2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(Constants.ROUNDNESS),
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: Constants.SPACING),
                          DecoratedBox(
                            decoration: const BoxDecoration(),
                            child: SvgPicture.asset(
                              "assets/images/forgot_password.svg",
                              semanticsLabel: "Doctors",
                              fit: BoxFit.contain,
                              height: 150,
                            ),
                          ),
                          const SizedBox(height: Constants.SPACING),
                          const Text(
                            "Reset Password",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Kindly provide your phone number \nor email address!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onTertiaryContainer,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: Constants.SPACING),
                          FormInputTextField(
                            controler: username,
                            placeholder: "Enter username or email",
                            prefixIcon: Icons.account_circle,
                            label: "Email or phone number",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: Constants.SPACING),
                          const SizedBox(height: Constants.SPACING),
                          Button(
                            title: "Submit",
                            onPress: handleSubmit,
                          ),
                          const SizedBox(
                            height: Constants.SPACING,
                          ),
                          LinkedRichText(
                            linked: "",
                            unlinked: "Back to login",
                            onPress: () => context.goNamed(RouteNames.LOGIN_SCREEN),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
