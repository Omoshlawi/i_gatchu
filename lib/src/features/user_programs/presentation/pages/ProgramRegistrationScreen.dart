import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:i_gatchu/src/features/auth/data/providers/auth_provider.dart';
import 'package:i_gatchu/src/features/user_programs/data/models/user_program.dart';
import 'package:i_gatchu/src/features/user_programs/data/providers/program_provider.dart';
import 'package:i_gatchu/src/shared/input/Button.dart';
import 'package:i_gatchu/src/shared/layouts/ResponsiveWidgetFormLayout.dart';
import 'package:i_gatchu/src/shared/styles/input_styles.dart';
import 'package:i_gatchu/src/utils/constants.dart';
import 'package:i_gatchu/src/utils/helpers.dart';
import 'package:i_gatchu/src/utils/routes.dart';

class ProgramRegistrationScreen extends StatefulWidget {
  const ProgramRegistrationScreen({super.key});

  @override
  State<ProgramRegistrationScreen> createState() =>
      _ProgramRegistrationScreenState();
}

class _ProgramRegistrationScreenState extends State<ProgramRegistrationScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  String? _program;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => context.pop(),
        ),
        title: const Text("Register to a program"),
      ),
      body: ResponsiveWidgetFormLayout(
        buildPageContent: (context, color) =>
            SafeArea(
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
                      child: Consumer(
                        builder: (context, ref, child) {
                          final asyncUserPrograms = ref.watch(programProvider);
                          return asyncUserPrograms.when(
                            data: (userPrograms) =>
                                Column(
                                  children: [
                                    const SizedBox(height: Constants.SPACING),
                                    DecoratedBox(
                                      decoration: const BoxDecoration(),
                                      child: SvgPicture.asset(
                                        "assets/images/patient.svg",
                                        semanticsLabel: "Doctors",
                                        fit: BoxFit.contain,
                                        height: 150,
                                      ),
                                    ),
                                    const SizedBox(height: Constants.SPACING),
                                    const Text(
                                      "Add program",
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: Constants.SPACING),
                                    Text(
                                      "Kindly provide program details bellow to verify yourself.",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .onTertiaryContainer,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: Constants.SPACING),
                                    const SizedBox(height: Constants.SPACING),
                                    FormBuilderDropdown<String>(
                                      name: "programCode",
                                      decoration: inputDecoration(
                                        prefixIcon: Icons.read_more_outlined,
                                        label: "Program",
                                      ),
                                      items: _getUnregisteredPrograms(
                                          userPrograms),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                      onChanged: (value) {
                                        setState(() {
                                          _program = value;
                                        });
                                      },
                                    ),
                                    const SizedBox(height: Constants.SPACING),
                                    FormBuilderTextField(
                                      name: "mflCode",
                                      decoration: inputDecoration(
                                        prefixIcon: Icons.local_hospital,
                                        label: "Facility code",
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                    ),
                                    const SizedBox(height: Constants.SPACING),
                                    FormBuilderTextField(
                                      name: "uniquePatientProgramId",
                                      decoration: inputDecoration(
                                        placeholder: "e.g 1234567890",
                                        prefixIcon: Icons.verified_user,
                                        label: _getProgramId(_program),
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required()
                                      ]),
                                    ),
                                    const SizedBox(height: Constants.SPACING),
                                    FormBuilderTextField(
                                      name: "firstName",
                                      decoration: inputDecoration(
                                        placeholder: "e.g John",
                                        prefixIcon: Icons.person,
                                        label: "First Name",
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                    ),
                                    const SizedBox(height: Constants.SPACING),
                                    Button(
                                      title: "Register",
                                      loading: _loading,
                                      onPress: () {
                                        final programsNotifier =
                                        ref.read(programProvider.notifier);
                                        if (_formKey.currentState!
                                            .saveAndValidate()) {
                                          setState(() {
                                            _loading = true;
                                          });
                                          programsNotifier
                                              .registerProgram(
                                              _formKey.currentState!.value)
                                              .then((value) {
                                            context.goNamed(
                                                RouteNames.VERIFY_PROGRAM_OTP,
                                                extra: value);
                                          }).catchError((err) {
                                            handleResponseError(
                                                context,
                                                _formKey.currentState!.fields,
                                                err,
                                                ref
                                                    .read(
                                                    authStateProvider.notifier)
                                                    .logout);
                                          }).whenComplete(() =>
                                              setState(() {
                                                _loading = false;
                                              }));
                                        }
                                      },
                                    ),
                                  ],
                                ),
                            error: (error, _) =>
                                Center(child: Text(error.toString())),
                            loading: () =>
                            const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
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

List<DropdownMenuItem<String>> _getUnregisteredPrograms(
    List<UserProgram> programs) {
  return ProgramCodeNames.SUPPOTED_PROGRAM_CODES
      .where((code) =>
  !programs.any((program) => program.program.programCode == code))
      .map((e) =>
      DropdownMenuItem(
          value: e,
          child: Text(
              ProgramCodeNames.getProgramNameByCode(e) ?? "Not Supported")))
      .toList();
}

String _getProgramId(program) {
  switch (program) {
    case ProgramCodeNames.HIV:
      return "CCC Number";
    default:
      return "Unique Program Identifier";
  }
}
