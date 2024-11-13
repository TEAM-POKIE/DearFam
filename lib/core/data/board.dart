class BoardModel {
  final String id;
  final String title;
  final String content;
  final String picture;
  BoardModel({
    required this.id,
    required this.content,
    required this.title,
    required this.picture,
  });
  BoardModel.fromJson({
    required Map<String, dynamic> json,
  })  : id = json['id'],
        content = json['content'],
        title = json['title'],
        picture = json['picture'];
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'date': title,
      'create': picture,
    };
  }
}
