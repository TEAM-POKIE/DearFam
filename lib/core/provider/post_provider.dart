import 'package:flutter_riverpod/flutter_riverpod.dart';

class Post {
  final String id;
  final String title;
  final String content;

  Post(this.id, this.title, this.content);
}

class PostNotifier extends StateNotifier<List<Post>> {
  PostNotifier() : super([]);

  void addPost(String title, String content) {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    state = [...state, Post(id, title, content)];
  }
}

final postProvider = StateNotifierProvider<PostNotifier, List<Post>>((ref) {
  return PostNotifier();
});
