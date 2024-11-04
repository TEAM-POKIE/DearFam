import 'package:flutter/material.dart';

class PhotoViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('제목'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
