import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:i_gatchu/src/features/user/data/providers/user_provider.dart';
import 'package:i_gatchu/src/features/user_preference/data/providers/settings_provider.dart';
import 'package:i_gatchu/src/shared/display/AppCard.dart';
import 'package:i_gatchu/src/utils/routes.dart';

class _SettingsItem {
  final IconData? leadingIcon;
  final Widget? trailingIcon;
  final String title;
  final String? subTitle;
  final void Function()? onPress;

  _SettingsItem(
      {required this.title,
      this.onPress,
        this.subTitle,
      this.trailingIcon,
      this.leadingIcon});
}

_settingsItem(BuildContext context) => [
      _SettingsItem(
        title: "Profile",
        leadingIcon: Icons.account_circle,
        onPress: () => context.goNamed(RouteNames.PROFILE_SETTINGS),
      ),
      _SettingsItem(
          title: "Theme",
          leadingIcon: Icons.light_mode,
          trailingIcon: Consumer(
            builder: (context, ref, child) => Switch(
              value: ref.watch(settingsNotifierProvider).theme == "dark",
              onChanged: (value) => ref
                  .read(settingsNotifierProvider.notifier)
                  .patchSettings(theme: value ? "dark" : "light"),
            ),
          )),
      _SettingsItem(
        title: "Privacy",
        leadingIcon: Icons.security,
        onPress: () => context.goNamed(RouteNames.PRIVACY_SETTINGS),
      ),
      _SettingsItem(
          title: "Plugins", leadingIcon: Icons.private_connectivity_outlined),
      _SettingsItem(
        title: "Change Password",
        leadingIcon: Icons.key,
        onPress: () => context.goNamed(RouteNames.CHANGE_PASSWORD),
      )
    ];

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _items = _settingsItem(context);
    final user = ref.watch(userProvider);
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Settings")),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final item = _items[index];
            return AppCard(
              variant: CardVariant.OUTLINED,
              child: ListTile(
                leading: Icon(item.leadingIcon),
                title: Text(item.title),
                onTap: item.onPress,
                trailing: item.trailingIcon,
              ),
            );
          },
          itemCount: _items.length,
        ));
  }
}
