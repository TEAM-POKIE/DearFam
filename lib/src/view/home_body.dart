import 'package:dearfam/core/constants/style.dart';
import 'package:dearfam/src/view/create_post_page.dart';
import 'package:dearfam/src/view/lastWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorSystem.brandMainlightColor,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: PageController(viewportFraction: 0.87),
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _buildPage('assets/image/sopicture.png', '아빠는 딸램ss을 ...',
                    '아빠는 이때 결심했단다 .. 우리딸을 절대 울리지 않기로.. 큰딸 아니? 너는 억울하거나 속상하면 항상 아랫입술이 삐죽 나오는 버릇이 있단다.. 저 날 저 사진도 그런 날이었지. 딸램은 기억이 안나겠지만 아빠는 ...'),
                _buildPage('assets/image/so2.png', '아빠는 딸램을 ...', '내용2'),
                _buildPage('assets/image/so3.png', '아빠는 딸램을 ...', '내용3'),
                Lastwidget(),
                CreatePostPage(),
              ],
            ),
          ),
          Slider(
            value: _currentPage.toDouble(),
            divisions: 4, // 페이지 수 - 1
            min: 0,
            max: 4, // 페이지 수 - 1
            activeColor: Color(0xffF5751E), // 활성 슬라이더 색상
            inactiveColor: Colors.grey, // 비활성 슬라이더 색상
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
                Image.asset(
                  imagePath,
                  width: 270.w,

                  height: 280.h, // 원원하는 높이로 설정
                ),
                SizedBox(
                  height: 15.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      width: 300.w,
                      child: Text(
                        content,
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
    );
  }
}
