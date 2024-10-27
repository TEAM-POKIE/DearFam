import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageNotifier extends StateNotifier<bool> {
  PageNotifier() : super(false);

  void togglePage() {
    state = !state;
  }
}

final pageProvider = StateNotifierProvider<PageNotifier, bool>((ref) {
  return PageNotifier();
});
