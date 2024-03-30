import 'package:flutter/material.dart';

class RadioGroupItem {
  final String value;
  final String title;
  final IconData icon;

  RadioGroupItem({required this.value, required this.title,required this.icon});
}

class RadioGroup extends StatelessWidget {
  /// @items: are the radio ui data
  /// @value: Currently selected radio btn value
  /// @onValueChanged: Callback every time the current selection changes
  final List<RadioGroupItem> items;
  final String? value;
  final void Function(String? value)? onValueChanged;

  const RadioGroup(
      {super.key, required this.items, this.onValueChanged, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (e) => RadioListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(e.title),
                  Icon(e.icon),
                ],
              ),

              value: e.value,
              groupValue: value,
              onChanged: onValueChanged,
            ),
          )
          .toList(),
    );
  }
}
