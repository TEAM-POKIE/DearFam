import 'package:dearfam/core/constants/style.dart';
import 'package:dearfam/src/pages/photo_view_page.dart';
import 'package:dearfam/core/provider/page_provider.dart';
import 'package:dearfam/src/view/lastWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBody extends ConsumerStatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends ConsumerState<HomeBody> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    final postList = ref.watch(postProvider);

    final List<Widget> pages = [
      _buildPage('assets/image/mainPicture.png', '첫 가족사진',
          '이 날은 가족 모두가 처음으로 함께 사진을 찍은 날이야. 너희들의 환한 웃음과 함께 정말 행복한 순간이었지. 앞으로도 소중한 추억을 많이 남기고 싶구나. 😊 우리 가족 사랑해!'),
      _buildPage('assets/image/so2.png', '아빠는 딸램을 ...', '내용2'),
      _buildPage('assets/image/so3.png', '아빠는 딸램을 ...', '내용3'),
      ...postList
          .map((post) => _buildPage(
              'assets/image/sopicture.png', post.title, post.content))
          .toList(),
      Lastwidget(),
    ];

    return Container(
      color: ColorSystem.brandMainColor2,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: BouncingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: pages.length,
              itemBuilder: (context, index) {
                double scale = _currentPage == index ? 1.0 : 0.9;
                return Transform.scale(
                  scale: scale,
                  child: pages[index],
                );
              },
            ),
          ),
          Slider(
            value: _currentPage.toDouble(),
            divisions: pages.length - 1,
            min: 0,
            max: (pages.length - 1).toDouble(),
            activeColor: Color(0xffF5751E),
            inactiveColor: Colors.grey,
            onChanged: (value) {
              setState(() {
                _currentPage = value.toInt();
                _pageController.animateToPage(
                  _currentPage,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String imagePath, String title, String content) {
    return GestureDetector(
      onTap: () {
        String postId = 'some_post_id';
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoViewPage(postId: postId),
          ),
        );
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0.w),
              width: 320.0.w,
              height: 468.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.grey),
                color: ColorSystem.textWhite,
              ),
              child: Column(
                children: [
                  Image.asset(
                    imagePath,
                    width: 390.w,
                    height: 280.h,
                  ),
                  SizedBox(height: 15.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        width: 300.w,
                        child: Text(
                          content.length > 100
                              ? content.substring(0, 100) + '...'
                              : content,
                          style: TextStyle(color: Colors.grey[600]),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
