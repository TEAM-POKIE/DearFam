import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dearfam/src/view/photo_view/photo_view_panel.dart';

class PhotoViewPage extends StatelessWidget {
  final String postId;

  PhotoViewPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoViewPanel(postId: postId),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
