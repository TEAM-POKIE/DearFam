import 'package:dearfam/src/reuse/app_bar_view.dart';
import 'package:flutter/material.dart';

class FamilyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(),
      body: Center(
        child: Text('가족 페이지'),
      ),
    );
  }
}

