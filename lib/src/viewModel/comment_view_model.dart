import 'package:http/http.dart' as http;
import 'dart:convert';

class CommentViewModel {
  final String postId;

  CommentViewModel(this.postId);

  Future<void> saveComment(String comment) async {
    final url = Uri.parse(
        'https://dearfam-1e2fe-default-rtdb.firebaseio.com/comments/$postId.json');
    try {
      await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'comment': comment, 'name': '나', 'image': 'assets/image/fa3.png'}),
      );
      await fetchComments();
    } catch (error) {
      print('댓글 저장 실패: $error');
    }
  }

  Future<List<Map<String, dynamic>>> fetchComments() async {
    final url = Uri.parse(
        'https://dearfam-1e2fe-default-rtdb.firebaseio.com/comments/$postId.json');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data.entries
            .map((entry) => {
                  'comment': entry.value['comment'] as String,
                  'name': entry.value['name'] as String,
                  'image': entry.value['image'] as String,
                })
            .toList();
      } else {
        throw Exception('댓글을 불러오는 데 실패했습니다.');
      }
    } catch (error) {
      print('댓글 불러오기 실패: $error');
      return [];
    }
  }
}
