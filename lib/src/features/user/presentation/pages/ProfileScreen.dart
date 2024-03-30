import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:i_gatchu/src/features/user/data/providers/user_provider.dart';
import 'package:i_gatchu/src/shared/display/ProfileCard.dart';
import 'package:i_gatchu/src/shared/extensions/extensions.dart';
import 'package:i_gatchu/src/utils/routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).colorScheme.onPrimary;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.chevron_left),
        ),
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () => context.goNamed(RouteNames.PROFILE_EDIT_FORM),
            icon: const Icon(Icons.mode_edit_outlined),
          )
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final userAsync = ref.watch(userProvider);
          return userAsync.when(
            data: (user) => ProfileCard(
              height: MediaQuery.of(context).size.height,
              header: Text((user.name ?? "").titleCase),
              image: user.image,
              icon: Icons.person,
              buildItem: (context, item) => item,
              items: [
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.perm_identity),
                  title: const Text("Username"),
                  subtitle: Text(user.username),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text("Email"),
                  subtitle: Text(user.email),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text("Phone number"),
                  subtitle: Text(user.phoneNumber),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.account_circle_outlined),
                  title: const Text("Gender"),
                  subtitle: Text(user.gender == "MALE" ? "Male" : user.gender == "FEMALE" ? "Female" :"Unknown"),
                ),
                const Divider(),
              ],
            ),
            error: (error, _) => Center(child: Text(error.toString())),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
