import 'package:dearfam/core/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Lastwidget extends StatefulWidget {
  @override
  _LastwidgetState createState() => _LastwidgetState();
}

class _LastwidgetState extends State<Lastwidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0.w),
            width: 300.0.w,
            height: 468.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.grey),
              color: ColorSystem.brandMainWhite,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 270.w,
                      height: 280.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: ColorSystem.brandMainGrey4,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "추억을 더 공유해보세요 !",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "가족에게 일상과 추억의 이야기를 공유해보세요!",
                      style: TextStyle(color: Colors.grey[600]),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // 버튼 클릭 시 동작 추가
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF5751E), // 버튼 색상
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fixedSize: Size(270.w, 40.h),
                      ),
                      child: Text(
                        '추억 공유하러 가기',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
