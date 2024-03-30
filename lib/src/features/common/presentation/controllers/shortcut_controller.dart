import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/features/common/data/repositories/shortcut_repository.dart';

class ShortcutController extends StateNotifier<List<String>> {
  final ShortcutRepository _repository;
  final int _maxShortcuts = 5;

  int get maxShortcuts => _maxShortcuts;

  ShortcutController(this._repository) : super([]) {
    _repository.getShortcuts().then((value) => state = value);
  }

  Future<void> addShortcut(String menu) async {
    if (state.length < 5) {
      state = [...state, menu];
    }
  }

  Future<void> deleteShortcut(String menu) async {
    state = state.where((element) => element != menu).toList();
  }
}
