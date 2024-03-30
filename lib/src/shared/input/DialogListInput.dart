import 'package:flutter/material.dart';
import 'package:i_gatchu/src/shared/display/AppCard.dart';
import 'package:i_gatchu/src/utils/constants.dart';


class DialogListInput<T> extends StatelessWidget {
  final InputDecoration? decoration;
  final List<T> items;
  final String Function(T item) labelExtractor;
  final String Function(T item) keyExtractor;
  final void Function(List<T> item)? onChange;
  final void Function()? onAddTapped;

  const DialogListInput(
      {super.key,
      this.decoration,
      this.items = const [],
      required this.labelExtractor,
      required this.keyExtractor,
      this.onAddTapped,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: decoration?.copyWith(
              suffix: IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddTapped,
          )) ??
          InputDecoration(
            suffix: IconButton(
              icon: const Icon(Icons.add),
              onPressed: onAddTapped,
            ),
          ),
      expands: false,
      child: Container(
        child: items.isNotEmpty == true
            ? Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: items
                            .map(
                              (e) => AppCard(
                                onTap: onChange != null
                                    ? () {
                                        onChange!(items
                                            .where((element) =>
                                                keyExtractor(e) !=
                                                keyExtractor(element))
                                            .toList());
                                      }
                                    : null,
                                child: SizedBox(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.all(Constants.SPACING),
                                    child: Text(labelExtractor(e)),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              )
            : Text(
                decoration?.hintText ?? "Add",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
      ),
    );
  }
}
