import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PageNotifier extends StateNotifier<bool> {
  PageNotifier() : super(false);

  void togglePage() {
    state = !state;
  }
}

final pageProvider = StateNotifierProvider<PageNotifier, bool>((ref) {
  return PageNotifier();
});

class Post {
  final String title;
  final String content;

  Post(this.title, this.content);
}

class PostNotifier extends StateNotifier<List<Post>> {
  PostNotifier() : super([]);

  void postBoard(String image, String title, String content) {
    final url = Uri.https(
      'https://dearfam-1e2fe-default-rtdb.firebaseio.com/',
      'flutter-architecture-test.json',
    );
    http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          'image': image,
          'title': title,
          'content': content,
        },
      ),
    );
  }
}

final postProvider = StateNotifierProvider<PostNotifier, List<Post>>((ref) {
  return PostNotifier();
});

class FavoriteNotifier extends StateNotifier<bool> {
  FavoriteNotifier() : super(false);

  void toggleFavorite() {
    state = !state;
  }
}

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, bool>((ref) {
  return FavoriteNotifier();
});
