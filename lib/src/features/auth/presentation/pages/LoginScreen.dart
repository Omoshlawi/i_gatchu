import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:i_gatchu/src/features/auth/data/providers/auth_provider.dart';
import 'package:i_gatchu/src/features/user/data/providers/user_provider.dart';
import 'package:i_gatchu/src/shared/display/LinkedRichText.dart';
import 'package:i_gatchu/src/shared/display/Logo.dart';
import 'package:i_gatchu/src/shared/input/Button.dart';
import 'package:i_gatchu/src/shared/layouts/ResponsiveWidgetFormLayout.dart';
import 'package:i_gatchu/src/shared/styles/input_styles.dart';
import 'package:i_gatchu/src/utils/constants.dart';
import 'package:i_gatchu/src/utils/helpers.dart';
import 'package:i_gatchu/src/utils/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _hidePassword = true;
  bool _loading = false;

  void _togglePassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: ResponsiveWidgetFormLayout(
        buildPageContent: (BuildContext context, Color? color) => SafeArea(
            child: FormBuilder(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(Constants.SPACING * 2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(Constants.ROUNDNESS),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  const SizedBox(height: Constants.SPACING),
                  const DecoratedBox(
                    decoration: BoxDecoration(),
                    child: Logo(),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: Constants.SPACING),
                  FormBuilderTextField(
                    name: "username",
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    decoration: inputDecoration(
                      prefixIcon: Icons.account_circle,
                      label: "Username",
                      placeholder: "e.g john",
                    ),
                  ),
                  const SizedBox(height: Constants.SPACING),
                  FormBuilderTextField(
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    name: "password",
                    obscureText: _hidePassword,
                    decoration: inputDecoration(
                        prefixIcon: Icons.lock,
                        label: "Password",
                        placeholder: "********",
                        onSurfixIconPressed: _togglePassword,
                        surfixIcon: _hidePassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                  ),
                  const SizedBox(height: Constants.SPACING * 2),
                  LinkedRichText(
                    linked: "Don't have account?  ",
                    unlinked: 'Register   ',
                    onPress: () => context.goNamed(RouteNames.REGISTER_SCREEN),
                  ),
                  const SizedBox(height: Constants.SPACING),
                  Consumer(
                    builder: (context, ref, child) {
                      return Button(
                        title: "LOGIN",
                        loading: _loading,
                        onPress: () {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.saveAndValidate()) {
                            setState(() {
                              _loading = true;
                            });
                            final authNotifier =
                                ref.read(authStateProvider.notifier);
                            authNotifier
                                .login(_formKey.currentState!.value)
                                .then((_) {
                              //     Update user state
                              ref.read(userProvider.notifier).getUser();
                            }).then(
                              (_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Login successful!'),
                                  ),
                                );
                              },
                            ).catchError((error) {
                              handleResponseError(
                                context,
                                _formKey.currentState!.fields,
                                error,
                                authNotifier.logout,
                              );
                            }).whenComplete(
                              () {
                                if (mounted) {
                                  setState(() {
                                    _loading = false;
                                  });
                                }
                              },
                            );
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: Constants.SPACING,
                  ),
                  LinkedRichText(
                    linked: "Forgot password ? ",
                    unlinked: "Reset",
                    onPress: () =>
                        context.goNamed(RouteNames.RESET_PASSWORD_SCREEN),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
