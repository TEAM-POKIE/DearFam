import 'package:dearfam/src/reuse/app_bar_view.dart';
import 'package:flutter/material.dart';

class GoodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(),
      body: Center(
        child: Text('굿즈 페이지'),
      ),
    );
  }
}
