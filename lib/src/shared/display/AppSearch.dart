import 'package:flutter/material.dart';

class AppSearch extends StatefulWidget {
  final void Function()? onFilterPressed;
  const AppSearch({super.key, this.onFilterPressed});

  @override
  State<AppSearch> createState() => _AppSearchState();
}

class _AppSearchState extends State<AppSearch> {

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, controller) => SearchBar(
        elevation: const MaterialStatePropertyAll<double>(10),
        controller: controller,
        padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0)),
        onTap: () {
          controller.openView();
        },
        onChanged: (_) {
          controller.openView();
        },
        leading: const Icon(Icons.search),
        trailing: <Widget>[
          Tooltip(
            message: 'Filter',
            child: IconButton(
              icon: const Icon(Icons.tune),
              onPressed: widget.onFilterPressed,
            ),
          )
        ],
      ),
      suggestionsBuilder:
          (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      },

    );
  }
}
