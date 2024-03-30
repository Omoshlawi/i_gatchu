import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:i_gatchu/src/shared/styles/input_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:i_gatchu/src/features/auth/data/providers/auth_provider.dart';
import 'package:i_gatchu/src/features/user/data/models/user.dart';
import 'package:i_gatchu/src/features/user/data/providers/user_provider.dart';
import 'package:i_gatchu/src/shared/input/Button.dart';
import 'package:i_gatchu/src/utils/constants.dart';
import 'package:i_gatchu/src/utils/helpers.dart';
import 'package:i_gatchu/src/utils/routes.dart';

import '../../../../shared/display/Logo.dart';

class ProfileWizardFormScreen extends HookConsumerWidget {
  const ProfileWizardFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final currentStep = useState<int>(0);
    final theme = Theme.of(context);
    final loading = useState<bool>(false);
    final userAsync = ref.watch(userProvider);

    void handleSubmit() {
      if (formKey.currentState != null &&
          formKey.currentState!.saveAndValidate()) {
        final formState = formKey.currentState!.value;
        loading.value = true;
        final authNotifier = ref.read(userProvider.notifier);
        authNotifier
            .updateUser(
          User.fromJson(formState),
        )
            .then(
          (value) {
            //     Update user state

            return authNotifier.getUser();
          },
        ).then(
          (value) {
            return ref.read(authStateProvider.notifier).markProfileAsUpdated();
          },
        ).then(
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Profile updated successfully!")));
          },
        ).catchError(
          (error) {
            handleResponseError(
              context,
              formKey.currentState!.fields,
              error,
              ref.read(authStateProvider.notifier).logout,
            );
          },
        ).whenComplete(() {
          loading.value = false;
        });
      }
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Consumer(
            builder: (context, ref, child) {
              final authState = ref.watch(authStateProvider);
              return IconButton(
                onPressed: () {
                  try {
                    authState.whenData((value) {
                      if (value.isProfileComplete) {
                        context.goNamed(RouteNames.PROFILE_SETTINGS);
                      }
                    });
                  } on GoError catch (e) {
                    debugPrint("[DEBUG-PROFILE-WIZARD]: $e");
                  }
                },
                icon: const Icon(Icons.chevron_left),
              );
            },
          ),
          title: const Text("Update profile"),
        ),
        body: SafeArea(
          child: userAsync.when(
            data: (user) => FormBuilder(
              key: formKey,
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
                        "Update profile",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: Constants.SPACING),
                      const SizedBox(height: Constants.SPACING),
                      FormBuilderTextField(
                        name: "username",
                        initialValue: user.username,
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
                        name: "name",
                        initialValue: user.name,
                        decoration: inputDecoration(
                          placeholder: "e.g John doe",
                          prefixIcon: Icons.person,
                          label: "Name",
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      const SizedBox(height: Constants.SPACING),
                      FormBuilderTextField(
                        name: "email",
                        initialValue: user.email,
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
                        initialValue: user.phoneNumber,
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
                      FormBuilderDropdown(
                        initialValue:
                            user.gender == "UNKNOWN" ? null : user.gender,
                        name: "gender",
                        decoration: inputDecoration(
                          prefixIcon: Icons.accessibility,
                          label: "Gender",
                        ),
                        // validator: FormBuilderValidators.compose([
                        //   FormBuilderValidators.required(),
                        // ]),
                        items: const [
                          DropdownMenuItem(
                            value: "MALE",
                            child: Text("Male"),
                          ),
                          DropdownMenuItem(
                            value: "FEMALE",
                            child: Text("Female"),
                          ),
                        ],
                      ),
                      const SizedBox(height: Constants.SPACING),
                      Consumer(
                        builder: (context, ref, child) {
                          final authState = ref.watch(authStateProvider);
                          return Button(
                            loading: loading.value,
                            title: "Submit",
                            onPress: handleSubmit,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            error: (error, _) => Center(child: Text(error.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
