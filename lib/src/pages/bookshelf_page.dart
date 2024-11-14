import 'package:dearfam/src/reuse/app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:dearfam/src/view/bookshelf_body.dart';

class BookshelfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(
        firstImage: 'assets/image/header4.svg',
        secondimage: 'assets/image/header5.svg',
      ),
      body: BookshelfBody(),
    );
  }
}
