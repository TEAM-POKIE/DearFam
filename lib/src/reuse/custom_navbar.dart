import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dearfam/core/constants/style.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorSystem.brandMainlightColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 0.1,
            blurRadius: 0.1,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        child: BottomNavigationBar(
          backgroundColor: ColorSystem.brandMainlightColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/image/navhome.svg',
                color: currentIndex == 0
                    ? ColorSystem.brandMainColor
                    : ColorSystem.brandMainGrey,
              ),
              label: '일상',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/image/navbookShelf.svg',
                color: currentIndex == 1
                    ? ColorSystem.brandMainColor
                    : ColorSystem.brandMainGrey,
              ),
              label: '책장',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/image/navgoods.svg',
                color: currentIndex == 2
                    ? ColorSystem.brandMainColor
                    : ColorSystem.brandMainGrey,
              ),
              label: '굿즈',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/image/navfamily.svg',
                color: currentIndex == 3
                    ? ColorSystem.brandMainColor
                    : ColorSystem.brandMainGrey,
              ),
              label: '가족',
            ),
          ],
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorSystem.brandMainColor,
          unselectedItemColor: ColorSystem.brandMainGrey,
        ),
      ),
    );
  }
}
