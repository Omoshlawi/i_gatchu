import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:i_gatchu/src/features/auth/data/providers/auth_provider.dart';
import 'package:i_gatchu/src/features/user_programs/data/providers/program_provider.dart';
import 'package:i_gatchu/src/shared/styles/input_styles.dart';
import 'package:i_gatchu/src/utils/constants.dart';
import 'package:i_gatchu/src/utils/routes.dart';
import '../../../../shared/input/Button.dart';
import '../../../../utils/helpers.dart';
import '../../data/models/program_verification_detail.dart';

class ProgramVerificationScreen extends HookConsumerWidget {
  final ProgramVerificationDetail verificationDetail;

  const ProgramVerificationScreen(
      {super.key, required this.verificationDetail});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final theme = Theme.of(context);
    final loading = useState<bool>(false);
    final sent = useState<bool>(false);
    final submittingRequest = useState<bool>(false);
    final programNotifier = ref.watch(programProvider.notifier);

    handleSubmit() {
      if (formKey.currentState != null &&
          formKey.currentState!.saveAndValidate()) {
        loading.value = true;
        final programNotifier = ref.watch(programProvider.notifier);
        programNotifier.verifyProgramOTP({
          ...formKey.currentState!.value,
          "programCode": verificationDetail.programCode
        }).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  "${ProgramCodeNames.getProgramNameByCode(verificationDetail.programCode)} Program Registered successfully"),
            ),
          );
          context.go("/");
        }).catchError((err) {
          handleResponseError(context, formKey.currentState!.fields, err, ref.read(authStateProvider.notifier).logout);
        }).whenComplete(() => loading.value = false);
      }
    }

    handleRequestOTP() {
      if (formKey.currentState != null &&
          formKey.currentState!.fields["mode"]!.validate()) {
        sent.value = true;
        submittingRequest.value = true;
        programNotifier.getVerificationCode(formKey.currentState!.instantValue).then(
          (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          },
        ).catchError((error) {
          handleResponseError(
            context,
            formKey.currentState!.fields,
            error,
            ref.watch(authStateProvider.notifier).logout,
          );
        }).whenComplete(
          () {
            submittingRequest.value = false;
          },
        );
      }

    }

    return Scaffold(
      body: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(Constants.SPACING),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.security, size: 80),
              const SizedBox(height: Constants.SPACING),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Text(
                  "Verify program",
                  style: theme.textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: Constants.SPACING),
              FormBuilderRadioGroup(
                enabled: !loading.value,
                name: "mode",
                decoration: InputDecoration(
                  border: InputBorder.none,
                  label: Text(
                    verificationDetail.message,
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Kindly choose verification method"),
                ]),
                options: verificationDetail.contacts
                    .map(
                      (e) => FormBuilderFieldOption(
                        value: e.contact,
                        child: ListTile(
                          title: Text(e.type),
                          subtitle: Text(e.contact),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: Constants.SPACING),
              // if (!loading.value)
                FormBuilderTextField(
                  name: "otp",
                  enabled: !loading.value,
                  initialValue: "",
                  decoration: widgetSurfixIconDecoration(
                    placeholder: "Enter OTP Verification code",
                    prefixIcon: Icons.lock,
                    surfixIcon: submittingRequest.value
                        ? const CircularProgressIndicator()
                        : Text(
                            sent.value ? "Resend Code" : "Get code",
                          ),
                    onSurfixIconPressed: handleRequestOTP,
                    label: "OTP verification code",
                  ),
                  // readOnly: !(_formKey.currentState!.value["mode"].isNotEmpty == true && _sent),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
              const SizedBox(height: Constants.SPACING),
              Button(
                title: "Verify",
                onPress: handleSubmit,
                loading: loading.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
