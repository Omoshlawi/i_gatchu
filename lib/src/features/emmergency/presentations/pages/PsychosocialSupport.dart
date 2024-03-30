import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_gatchu/src/utils/routes.dart';

class PsychosocialSupport extends StatelessWidget {
  const PsychosocialSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      leading: IconButton(
        onPressed: () => context.goNamed(RouteNames.LANDING_SCREEN),
        icon: const Icon(Icons.chevron_left),
      ),
      title: const Text("Psychosocial support"),
    ),);
  }
}
