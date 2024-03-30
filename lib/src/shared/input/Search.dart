import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TextField(
      decoration: InputDecoration(
        hintText: "Search ...",
        prefixIcon: Icon(Icons.search),
        border: InputBorder.none,
      ),
    );
  }
}
