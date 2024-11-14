import 'package:dearfam/core/constants/style.dart';
import 'package:dearfam/src/view/create_post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dearfam/core/provider/page_provider.dart';
import 'package:flutter_svg/svg.dart';

class Lastwidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCreatePostPageActive = ref.watch(pageProvider);
    return isCreatePostPageActive
        ? CreatePostPage()
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      top: 40.h, left: 15.w, right: 15.w, bottom: 15.w),
                  width: 300.0.w,
                  height: 468.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey),
                    color: ColorSystem.textWhite,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "추억을 더 공유해보세요 !",
                            style: FontSystem.KR16B
                                .copyWith(color: ColorSystem.textBlack),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "가족에게 일상과 추억의 이야기를 공유해보세요!",
                            style: FontSystem.KR14R.copyWith(
                                color: ColorSystem.brandHeaderGreyColor),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      Center(
                        child: SvgPicture.asset(
                            'assets/image/dearPamEventLogo.svg'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ref.watch(pageProvider.notifier).togglePage();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF5751E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          fixedSize: Size(270.w, 49.h),
                        ),
                        child: Text(
                          '추억 공유하러 가기',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
