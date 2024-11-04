import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dearfam/core/constants/style.dart';

class PhotoViewPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      collapsed: Container(),
      minHeight: 400.h,
      maxHeight: 700.h,
      padding: EdgeInsets.all(18),
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      body: Container(
        alignment: Alignment.topCenter,
        child: Image.asset(
          'assets/image/mainPicture.png',
          width: double.infinity,
          height: 350.h,
          fit: BoxFit.cover,
        ),
      ),
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '이벤트 제목',
            style: FontSystem.KR18B,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                'assets/image/fa4.png',
                width: 30,
              ),
              SizedBox(width: 5),
              Text('김엄마', style: FontSystem.KR12R),
            ],
          ),
          SizedBox(height: 20),
          Text('내용'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/image/mainPicture.png',
                      width: 155.w,
                      height: 130.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorSystem.brandMainGrey,
                    ),
                    width: 155.w,
                    height: 130.h,
                    child: Center(
                      child: Text(
                        '+3 view more',
                        style: FontSystem.KR15R.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/image/mainPicture2.png',
                  width: 150.w,
                  height: 212.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
