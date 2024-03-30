import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:i_gatchu/src/app/navigation/menu/MenuItemsBuilder.dart';
import 'package:i_gatchu/src/app/navigation/menu/MenuOption.dart';
import 'package:i_gatchu/src/app/navigation/menu/menuItems.dart';
import 'package:i_gatchu/src/features/user_programs/data/providers/program_provider.dart';
import 'package:i_gatchu/src/shared/input/FormInputTextField.dart';
import 'package:i_gatchu/src/utils/constants.dart';
import 'package:i_gatchu/src/utils/routes.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: const Center(child: Text("Apps")),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_sharp),
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final userProgram = ref.watch(programProvider);
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(Constants.SPACING),
                  child: const FormInputTextField(
                    prefixIcon: Icons.search,
                    placeholder: "Search...",
                  ),
                ),
                Expanded(
                  child: userProgram.when(
                    data: (data) => MenuItemsBuilder(
                      itemBuilder: (item) => MenuOption(
                        title: item.title ?? "",
                        icon: item.icon,
                        // iconSize: 50,
                        onPress: item.onPressed,
                        // iconColor: theme.colorScheme.primary,
                        bgColor: item.title == "Add Programme"
                            ? theme.colorScheme.secondary
                            : null,
                      ),
                      items: [
                        // get generic menu items
                        ...getGenericMenuItems(context),
                        // get program menu items
                        ...data.map((e) {
                          final programCode = e.program.programCode;
                          return getProgramMenuItemByProgramCode(context, programCode);
                        }).toList(),
                        // Register new program
                        MenuItem(
                          icon: Icons.add,
                          title: "Add Programme",
                          onPressed: () => context.goNamed(RouteNames.PROGRAME_REGISTRATION_SCREEN),
                        ),
                      ],
                    ),
                    error: (error, _) => Center(child: Text(error.toString())),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
