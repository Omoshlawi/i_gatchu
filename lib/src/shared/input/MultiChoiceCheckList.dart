import 'package:flutter/material.dart';

class MultiChoiceCheckListChoice {
  final String label;
  final String value;

  MultiChoiceCheckListChoice({required this.label, required this.value});
}

class MultiChoiceCheckList extends StatelessWidget {
  final String label;
  final List<MultiChoiceCheckListChoice> items;
  final List<dynamic> value;
  final void Function(List<dynamic> value)? onValueChanged;

  const MultiChoiceCheckList({
    super.key,
    required this.items,
    required this.label,
    this.onValueChanged,
    this.value = const [],
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ExpansionTile(
      title: Text(label, style: theme.textTheme.titleMedium),
      children: items
          .map(
            (e) => CheckboxListTile(
              value: value.any((element) => element == e.value),
              onChanged: onValueChanged != null
                  ? (isChecked) {
                      if (value.any((element) => element == e.value)) {
                        // If in value then remove
                        onValueChanged!(value
                            .where((element) => element != e.value)
                            .toList());
                      } else {
                        // else add to value
                        onValueChanged!(value..add(e.value));
                      }
                    }
                  : null,
              title: Text(e.label),
            ),
          )
          .toList(),
    );
  }
}
