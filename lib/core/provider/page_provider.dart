import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageProvider extends StateNotifier<bool> {
  PageProvider() : super(false);

  void toggleCreatePostPage() {
    state = !state;
  }
}

final pageProvider = StateNotifierProvider<PageProvider, bool>((ref) {
  return PageProvider();
});
