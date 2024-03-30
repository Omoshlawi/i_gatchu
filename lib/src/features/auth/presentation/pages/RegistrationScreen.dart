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

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _hidePassword = true;
  bool _loading = false;

  void _toggleShowPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
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
            child: FormBuilder(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: Constants.SPACING),
                      const DecoratedBox(
                        decoration: BoxDecoration(),
                        child: Logo(),
                      ),
                      const SizedBox(height: Constants.SPACING),
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: Constants.SPACING),
                      const SizedBox(height: Constants.SPACING),
                      FormBuilderTextField(
                        name: "username",
                        decoration: inputDecoration(
                          placeholder: "e.g john",
                          prefixIcon: Icons.person,
                          label: "Username",
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(4),
                        ]),
                      ),
                      const SizedBox(height: Constants.SPACING),
                      FormBuilderTextField(
                        name: "email",
                        decoration: inputDecoration(
                          placeholder: "e.g abc@gmail.com",
                          prefixIcon: Icons.email,
                          label: "Email address",
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const SizedBox(height: Constants.SPACING),
                      FormBuilderTextField(
                        name: "phoneNumber",
                        decoration: inputDecoration(
                          placeholder: "e.g 0712345678",
                          prefixIcon: Icons.phone,
                          label: "Phone number",
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(10),
                          FormBuilderValidators.maxLength(13),
                        ]),
                      ),
                      const SizedBox(height: Constants.SPACING),
                      FormBuilderTextField(
                        name: "password",
                        obscureText: _hidePassword,
                        decoration: inputDecoration(
                            placeholder: "********",
                            prefixIcon: Icons.lock,
                            label: "Password",
                            surfixIcon: _hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onSurfixIconPressed: _toggleShowPassword),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      const SizedBox(height: Constants.SPACING),
                      FormBuilderTextField(
                        obscureText: _hidePassword,
                        name: "confirmPassword",
                        decoration: inputDecoration(
                            placeholder: "********",
                            prefixIcon: Icons.lock,
                            label: "Confirm Password",
                            surfixIcon: _hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onSurfixIconPressed: _toggleShowPassword),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          (value) =>
                              _formKey.currentState!.value["password"] != value
                                  ? "Password didn't match"
                                  : null
                        ]),
                      ),
                      FormBuilderCheckbox(
                        initialValue: false,
                        name: "termsAccepted",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          (value) => value == false
                              ? "You must accept terms and conditions"
                              : null
                        ]),
                        title: const Text("Accept terms and conditions"),
                      ),
                      const SizedBox(height: Constants.SPACING),
                      LinkedRichText(
                        linked: "Already have account? ",
                        unlinked: "Login",
                        onPress: () => context.goNamed(RouteNames.LOGIN_SCREEN),
                      ),
                      const SizedBox(height: Constants.SPACING),
                      Consumer(
                        builder: (context, ref, child) {
                          final authState = ref.watch(authStateProvider);
                          return Button(
                            loading: _loading,
                            title: "Register",
                            onPress: () {
                              if (_formKey.currentState != null &&
                                  _formKey.currentState!.saveAndValidate()) {
                                final formState = _formKey.currentState!.value;
                                setState(() {
                                  _loading = true;
                                });
                                final authNotifier =
                                    ref.read(authStateProvider.notifier);
                                authNotifier.register(formState).then((value) {
                                  //     Update user state
                                  ref.read(userProvider.notifier).getUser();
                                }).then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Registration successful!,'),
                                    ),
                                  );
                                }).catchError((error) {
                                  handleResponseError(
                                    context,
                                    _formKey.currentState!.fields,
                                    error,
                                    authNotifier.logout,
                                  );
                                }).whenComplete(() {
                                  if (mounted) {
                                    setState(() {
                                      _loading = false;
                                    });
                                  }
                                });
                              }
                            },
                          );
                        },
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
  }
}
