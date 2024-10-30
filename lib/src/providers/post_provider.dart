import 'package:flutter_riverpod/flutter_riverpod.dart';

class Post {
  final String title;
  final String content;

  Post(this.title, this.content);
}

class PostNotifier extends StateNotifier<List<Post>> {
  PostNotifier() : super([]);

  void addPost(String title, String content) {
    state = [...state, Post(title, content)];
  }
}

final postProvider = StateNotifierProvider<PostNotifier, List<Post>>((ref) {
  return PostNotifier();
}); 