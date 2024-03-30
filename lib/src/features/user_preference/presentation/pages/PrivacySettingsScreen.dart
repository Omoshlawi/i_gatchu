import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:i_gatchu/src/features/user_preference/data/providers/settings_provider.dart';
import 'package:i_gatchu/src/utils/constants.dart';

class PrivacySettingsScreen extends ConsumerWidget {
  const PrivacySettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.chevron_left),
        ),
        title: const Text("Privacy Settings"),
      ),
      body: ListView(children: [
        Container(
          color: theme.colorScheme.onPrimary,
          margin: const EdgeInsets.only(top: Constants.SPACING),
          padding: const EdgeInsets.symmetric(vertical: Constants.SPACING),
          child: ListTile(
            trailing: Switch(
              value: ref.watch(settingsNotifierProvider).isPrivacyEnabled,
              onChanged: (bool value) {
                final settings = ref.read(settingsNotifierProvider.notifier);
                settings.patchSettings(isPrivacyEnabled: !settings.getState().isPrivacyEnabled);
              },
            ),
            title: const Text("Pin Lock"),
            leading: const Icon(Icons.pin_outlined),
          ),
        ),Container(
          color: theme.colorScheme.onPrimary,
          margin: const EdgeInsets.only(top: Constants.SPACING),
          padding: const EdgeInsets.symmetric(vertical: Constants.SPACING),
          child: ListTile(
            trailing: Switch(
              value: ref.watch(settingsNotifierProvider).isPrivacyEnabled,
              onChanged: (bool value) {
                final settings = ref.read(settingsNotifierProvider.notifier);
                settings.patchSettings(isPrivacyEnabled: !settings.getState().isPrivacyEnabled);
              },
            ),
            title: const Text("Fingerprint Lock"),
            leading: const Icon(Icons.fingerprint),
          ),
        ),
      ]),
    );
  }
}
