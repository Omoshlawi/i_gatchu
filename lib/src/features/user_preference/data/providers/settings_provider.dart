import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/features/user_preference/data/models/Setings.dart';
import 'package:i_gatchu/src/features/user_preference/presentation/controlers/SettingsControler.dart';

final settingsNotifierProvider =
    StateNotifierProvider<SettingsController, Settings>(
  (ref) => SettingsController(),
);
