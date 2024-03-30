import 'package:flutter/material.dart';
import 'package:i_gatchu/src/utils/constants.dart';

InputDecoration inputDecoration({
  double? borderRadius,
  required IconData prefixIcon,
  IconData? surfixIcon,
  String? placeholder,
  String? label,
  final Function()? onPrefixIconPressed,
  final Function()? onSurfixIconPressed,
}) {
  return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? Constants.ROUNDNESS),
        ),
      ),
      prefixIcon: IconButton(
        icon: Icon(prefixIcon),
        onPressed: onPrefixIconPressed,
      ),
      hintText: placeholder,
      labelText: label,
      suffixIcon: surfixIcon != null
          ? IconButton(onPressed: onSurfixIconPressed, icon: Icon(surfixIcon))
          : null);
}

InputDecoration widgetSurfixIconDecoration({
  double? borderRadius,
  required IconData prefixIcon,
  Widget? surfixIcon,
  String? placeholder,
  String? label,
  final Function()? onPrefixIconPressed,
  final Function()? onSurfixIconPressed,
}) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius ?? Constants.ROUNDNESS),
      ),
    ),
    prefixIcon: IconButton(
      icon: Icon(prefixIcon),
      onPressed: onPrefixIconPressed,
    ),
    hintText: placeholder,
    label: label != null ? Text(label) : null,
    suffixIcon: surfixIcon != null
        ? IconButton(onPressed: onSurfixIconPressed, icon: surfixIcon)
        : null,
  );
}
