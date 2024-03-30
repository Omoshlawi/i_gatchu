import 'package:flutter/material.dart';

class FormDropDownInput extends FormField<String> {
  final void Function(String? item)? onItemChange;
  final void Function()? onPrefixIconPressed;
  final TextEditingController? controller;
  final String? error;
  final String? label;
  final IconData? prefixIcon;
  final List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;
  final double? width;

  FormDropDownInput(
      {Key? key,
      dynamic initialSelection,
      String? Function(String? item)? validator,
      void Function(String? item)? onSaved,
      this.label,
      this.prefixIcon,
      this.dropdownMenuEntries = const [],
      this.onItemChange,
      this.controller,
      this.error,
      this.onPrefixIconPressed,
      this.width})
      : super(
            key: key,
            validator: validator,
            initialValue: initialSelection,
            onSaved: onSaved,
            builder: (FormFieldState<dynamic> state) {
              return DropdownMenu<dynamic>(
                controller: controller,
                errorText: state.errorText ?? error,
                label: label != null ? Text(label) : null,
                leadingIcon: prefixIcon != null
                    ? IconButton(
                        onPressed: onPrefixIconPressed,
                        icon: Icon(prefixIcon),
                      )
                    : null,
                width: width,
                onSelected: (value) {
                  state.didChange(value);
                  if (onItemChange != null) {
                    onItemChange(value);
                  }
                },
                initialSelection: state.value,
                dropdownMenuEntries: dropdownMenuEntries,
              );
            });
}
