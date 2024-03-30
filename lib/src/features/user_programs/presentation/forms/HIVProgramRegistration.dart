import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:i_gatchu/src/shared/styles/input_styles.dart';
import 'package:i_gatchu/src/utils/constants.dart';

class HIVProgramRegistration extends StatelessWidget {

  const HIVProgramRegistration({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderTextField(
          initialValue: '1234567890',
          name: "uniquePatientProgramId",
          decoration: inputDecoration(
            placeholder: "e.g 1234567890",
            prefixIcon: Icons.verified_user,
            label: "CCC Number",
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.equalLength(10,errorText: 'Invalid ccc number.Must be 10 characters long'),
          ]),
        ),
        const SizedBox(height: Constants.SPACING),
        FormBuilderTextField(
          initialValue: "Betty",
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
        const SizedBox(
          height: Constants.SPACING,
        ),
      ],
    );
  }
}
