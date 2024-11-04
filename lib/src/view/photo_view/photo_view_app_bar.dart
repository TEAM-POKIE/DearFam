import 'package:flutter/material.dart';

class PhotoViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  PhotoViewAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
} 