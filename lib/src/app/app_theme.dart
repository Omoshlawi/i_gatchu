import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/features/user_preference/data/providers/settings_provider.dart';
import 'package:i_gatchu/src/utils/constants.dart';

final mainTheme = Provider<ThemeData>((ref) => ThemeData(
      fontFamily: "Play",
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xffbe0127),
        brightness: ref.watch(settingsNotifierProvider).theme == "dark"
            ? Brightness.dark
            : Brightness.light,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.ROUNDNESS),
          ),
          padding: const EdgeInsets.all(Constants.SPACING),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.ROUNDNESS),
          ),
          padding: const EdgeInsets.all(Constants.SPACING),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Constants.BUTTON_FONT_SIZE,
          ),
        ),
      ),
      useMaterial3: true,
    ));
final mainTheme1 = ThemeData(
  fontFamily: "Play",
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff2bb6aa),
    primary: const Color(0xff2bb6aa),
    onPrimary: const Color(0xffffffff),
    secondary: const Color(0xffd1eef1),
    background: const Color(0xffedfaf9),
    // onSurface: const Color(0xffffffff),//Default text color
    onTertiary: const Color(0xffffffff),
  ),
  useMaterial3: true,
);

//DF00F5FF
