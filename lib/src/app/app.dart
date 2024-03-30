import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/app/app_theme.dart';
import 'package:i_gatchu/src/app/navigation/app_router.dart';

class NishauriApp extends StatelessWidget {
  const NishauriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final router = ref.watch(routesProvider);
        return MaterialApp.router(
          title: "I gatchu",
          // routeInformationParser: router.routeInformationParser,
          // routerDelegate: router.routerDelegate,
          // routeInformationProvider: router.routeInformationProvider,
          routerConfig: router,
          theme: ref.watch(mainTheme),
          debugShowCheckedModeBanner: false,
        );
      }
    );
  }
}
