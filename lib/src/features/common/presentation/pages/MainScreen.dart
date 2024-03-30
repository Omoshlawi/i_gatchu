import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:i_gatchu/src/features/common/presentation/pages/HomeScreen.dart';
import 'package:i_gatchu/src/features/common/presentation/pages/MainMenuScreen.dart';
import 'package:i_gatchu/src/features/common/presentation/pages/SettingsScreen.dart';
import 'package:i_gatchu/src/features/user_preference/data/providers/settings_provider.dart';
import 'package:i_gatchu/src/features/user_preference/presentation/pages/PinAuthScreen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<MainScreen>
    with WidgetsBindingObserver {
  OverlayEntry? _overlayEntry;
  AppLifecycleState state = AppLifecycleState.inactive;
  int rebuild = 0;
  var _currIndex = 0;
  final _pages = const [
    HomeScreen(),
    MainMenuScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      handleAppStatusChange();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    this.state = state;
    handleAppStatusChange();
  }

  void handleAppStatusChange() {
    final settings = ref.watch(settingsNotifierProvider);
    // If app runs to background then set isAuthenticated to false
    if (state != AppLifecycleState.resumed && settings.isPrivacyEnabled) {
      ref
          .read(settingsNotifierProvider.notifier)
          .patchSettings(isAuthenticated: false);
    }
    // I user returns to foreground then show auth screen
    if (state == AppLifecycleState.resumed &&
        settings.isPrivacyEnabled &&
        !settings.isAuthenticated) showPinAuth(context);
  }

  void showPinAuth(BuildContext context) {
    // context.goNamed(RouteNames.UNLOCK_SCREEN);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      isDismissible: false,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async {
          // Disable the default back button behavior
          return false;
        },
        child: PinAuthScreen(
          authenticate: (value) {
            final settings = ref.watch(settingsNotifierProvider);
            final settingsSetter = ref.read(settingsNotifierProvider.notifier);
            if (value != null && settings.pin == value) {
              if (settings.isAuthenticated == false) {
                context.pop();
                settingsSetter.patchSettings(isAuthenticated: true);
              }
            } else {
              return "Invalid pin";
            }
            return null;
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currIndex = 1;
          });
        },
        child: const Icon(Icons.apps),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps_rounded),
            label: "",
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
