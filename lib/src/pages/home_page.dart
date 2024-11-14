import 'package:dearfam/src/reuse/app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:dearfam/src/view/home_body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarView(
          firstImage: 'assets/image/header1.svg',
          secondimage: 'assets/image/header5.svg',
        ),
        body: HomeBody());
  }
}
