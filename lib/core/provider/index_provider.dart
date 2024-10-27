import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier를 사용하여 index 상태를 관리
class IndexNotifier extends StateNotifier<int> {
  IndexNotifier() : super(0);

  void setIndex(int newIndex) {
    state = newIndex;
  }
}

// StateNotifierProvider를 사용하여 IndexNotifier를 제공
final indexProvider = StateNotifierProvider<IndexNotifier, int>((ref) {
  return IndexNotifier();
});
