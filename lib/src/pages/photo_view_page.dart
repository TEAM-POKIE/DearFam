import 'package:flutter/material.dart';
import 'package:dearfam/src/view/photo_view/photo_view_app_bar.dart';
import 'package:dearfam/src/view/photo_view/photo_view_panel.dart';

class PhotoViewPage extends StatelessWidget {
  final String title;
  final String content;

  PhotoViewPage({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PhotoViewAppBar(title: title),
      body: PhotoViewPanel(content: content),
    );
  }
} 