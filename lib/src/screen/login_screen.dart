import 'package:dearfam/core/constants/style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.brandMainColor2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80.h),
            SvgPicture.asset('assets/image/loginTop.svg'),
            SizedBox(height: 70.h),
            Text(
              'DearFam',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 70.h),
            SvgPicture.asset('assets/image/loginBottom.svg'),
            SizedBox(height: 80.h),
            Container(
              width: 305.w,
              height: 52.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
              ),
              child: ElevatedButton(
                onPressed: () {
                  context.go('/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorSystem.brandKakao,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/image/KakaoLogo.svg'),
                    SizedBox(width: 5.w),
                    Text('카카오계정으로 로그인', style: FontSystem.Login16M),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
