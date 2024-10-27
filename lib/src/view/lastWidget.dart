import 'package:dearfam/core/constants/style.dart';
import 'package:dearfam/src/view/create_post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dearfam/src/providers/page_provider.dart';

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
                      SizedBox(height: 15.h),
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
                          SizedBox(height: 15.h),
                          Text(
                            "추억을 더 공유해보세요 !",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            "가족에게 일상과 추억의 이야기를 공유해보세요!",
                            style: TextStyle(color: Colors.grey[600]),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 20.h),
                          ElevatedButton(
                            onPressed: () {
                              ref.watch(pageProvider.notifier).togglePage();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFF5751E),
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
