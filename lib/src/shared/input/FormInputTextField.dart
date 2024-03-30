import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class FormInputTextField extends StatefulWidget {
  final bool password;
  final String? Function(String? value)? validator;
  final Function()? onPrefixIconPressed;
  final Function()? onsurfixIconPressed;
  final Function(String value)? onChangeText;
  final IconData prefixIcon;
  final Widget? surfixIcon;
  final String? placeholder;
  final String? label;
  final TextEditingController? controler;
  final TextInputType? keyboardType;
  final double? borderRadius;
  final bool readOnly;
  final Function()? onTap;
  final void Function(String?)? onSaved;
  final String? error;
  final String? initialValue;

  const FormInputTextField({
    super.key,
    this.password = false,
    this.validator,
    required this.prefixIcon,
    this.placeholder,
    this.label,
    this.controler,
    this.onPrefixIconPressed,
    this.onsurfixIconPressed,
    this.surfixIcon,
    this.onChangeText,
    this.borderRadius,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
    this.onSaved,
    this.error,
    this.initialValue
  });

  @override
  State<FormInputTextField> createState() => _FormInputTextFieldState();
}

class _FormInputTextFieldState extends State<FormInputTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      controller: widget.controler,
      validator: widget.validator,
      obscureText: widget.password && showPassword == false,
      onChanged: widget.onChangeText,
      decoration: InputDecoration(
        errorText: widget.error,
        suffixIcon: widget.password
            ? IconButton(
                icon: Icon(showPassword
                    ? Icons.remove_red_eye_outlined
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword; // Toggle the value
                  });
                },
              )
            : widget.surfixIcon != null
                ? IconButton(
                    onPressed: widget.onsurfixIconPressed,
                    icon: widget.surfixIcon!)
                : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius ?? Constants.ROUNDNESS),
          ),
        ),
        prefixIcon: IconButton(
          icon: Icon(widget.prefixIcon),
          onPressed: widget.onPrefixIconPressed,
        ),
        hintText: widget.placeholder,
        label: widget.label != null ? Text(widget.label!): null,
      ),
    );
  }
}
