import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:i_gatchu/src/features/common/presentation/pages/HomeScreen.dart';
import 'package:i_gatchu/src/features/common/presentation/pages/SettingsScreen.dart';
import 'package:i_gatchu/src/features/user_preference/data/providers/settings_provider.dart';
import 'package:i_gatchu/src/features/user_preference/presentation/pages/PinAuthScreen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<MainScreen> {
  int rebuild = 0;
  var _currIndex = 0;
  final _pages = const [
    HomeScreen(),
    SettingsScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        currentIndex: _currIndex,
        onTap: (index) {
          setState(() {
            _currIndex = index;
          });
        },
      ),
      body: _pages.elementAt(_currIndex),
    );
  }
}
