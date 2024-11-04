import 'package:flutter/material.dart';
import 'package:dearfam/src/view/photo_view/photo_view_app_bar.dart';
import 'package:dearfam/src/view/photo_view/photo_view_panel.dart';

class PhotoViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PhotoViewAppBar(),
      body: PhotoViewPanel(),
    );
  }
}
