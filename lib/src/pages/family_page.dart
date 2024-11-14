import 'package:dearfam/src/reuse/app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:dearfam/src/view/family_page_body.dart';

class FamilyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(
        firstImage: 'assets/image/header3.svg',
        secondimage: 'assets/image/header5.svg',
      ),
      body: FamilyPageBody(),
    );
  }
}
