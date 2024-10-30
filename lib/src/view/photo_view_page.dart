import 'package:flutter/material.dart';

class PhotoViewPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String content;

  PhotoViewPage({
    required this.imagePath,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            SizedBox(height: 20),
            Text(content),
          ],
        ),
      ),
    );
  }
}
