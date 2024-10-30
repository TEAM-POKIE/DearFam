import 'package:dearfam/core/constants/style.dart';
import 'package:dearfam/src/reuse/app_bar_view.dart';
import 'package:flutter/material.dart';

class BookshelfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: ColorSystem.brandMainGrey,
                    blurStyle: BlurStyle.inner,
                    blurRadius: 300.0,
                    offset: Offset(0, 0),
                    spreadRadius: 4),
              ],
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 20),
              color: ColorSystem.brandMainlightColor,
              child: _buildShelfRow([
                'assets/image/group1.png',
              ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: ColorSystem.brandMainGrey,
                    blurStyle: BlurStyle.inner,
                    blurRadius: 300.0,
                    offset: Offset(0, 0),
                    spreadRadius: 4),
              ],
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 20),
              color: ColorSystem.brandMainlightColor,
              child: _buildShelfRow([
                'assets/image/group2.png',
                'assets/image/group3.png',
              ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: ColorSystem.brandMainGrey,
                    blurStyle: BlurStyle.inner,
                    blurRadius: 300.0,
                    offset: Offset(0, 0),
                    spreadRadius: 4),
              ],
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 20),
              color: ColorSystem.brandMainlightColor,
              child: _buildShelfRow([
                'assets/image/group4.png',
                'assets/image/group5.png',
              ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: ColorSystem.brandMainGrey,
                    blurStyle: BlurStyle.inner,
                    blurRadius: 300.0,
                    offset: Offset(0, 0),
                    spreadRadius: 4),
              ],
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 20),
              color: ColorSystem.brandMainlightColor,
              child: _buildShelfRow([
                'assets/image/group6.png',
                'assets/image/group7.png',
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShelfRow(List<String> imagePaths) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: imagePaths.map((path) {
        return Image.asset(
          path,
          width: 100,
          height: 100,
        );
      }).toList(),
    );
  }
}
