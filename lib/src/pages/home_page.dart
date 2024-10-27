import 'package:dearfam/src/reuse/app_bar_view.dart';
import 'package:dearfam/src/view/home_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarView(), body: HomeBody());
  }
}
