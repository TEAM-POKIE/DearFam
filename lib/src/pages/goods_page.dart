import 'package:dearfam/src/reuse/app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:dearfam/src/view/goods_body.dart';

class GoodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(
        firstImage: 'assets/image/header5.svg',
      ),
      body: GoodsBody(),
    );
  }
}
