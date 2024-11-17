import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dearfam/core/constants/style.dart';
import 'package:dearfam/src/viewModel/comment_view_model.dart';

class PhotoViewPanel extends StatefulWidget {
  final String postId;

  PhotoViewPanel({Key? key, required this.postId}) : super(key: key);

  @override
  _PhotoViewPanelState createState() => _PhotoViewPanelState();
}

class _PhotoViewPanelState extends State<PhotoViewPanel> {
  final TextEditingController _commentController = TextEditingController();
  late CommentViewModel commentViewModel;
  late Future<List<Map<String, dynamic>>> commentsFuture;
  bool isPanelOpen = false; // 패널 열림 상태를 추적

  @override
  void initState() {
    super.initState();
    commentViewModel = CommentViewModel(widget.postId);
    commentsFuture = commentViewModel.fetchComments();
  }

  void _refreshComments() {
    setState(() {
      commentsFuture = commentViewModel.fetchComments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropTapClosesPanel: true,
      onPanelOpened: () {
        setState(() {
          isPanelOpen = true; // 패널이 열리면 상태 업데이트
        });
      },
      onPanelClosed: () {
        setState(() {
          isPanelOpen = false; // 패널이 닫히면 상태 업데이트
        });
      },
      collapsed: Container(),
      minHeight: 400.h,
      maxHeight: 720.h,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      body: Container(
        alignment: Alignment.topCenter,
        child: Image.asset(
          'assets/image/mainPicture.png',
          width: double.infinity,
          height: 460.h,
          fit: BoxFit.cover,
        ),
      ),
      panel: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          // 패널이 열릴 때만 스크롤을 허용
          if (!isPanelOpen) {
            return true; // 스크롤을 막음
          }
          return false; // 스크롤 허용
        },
        child: SingleChildScrollView(
          physics: isPanelOpen
              ? AlwaysScrollableScrollPhysics()
              : NeverScrollableScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(
                left: 10.h, bottom: 30.h, right: 10.h, top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '첫 가족사진',
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
                SizedBox(height: 5.h),
                Text(
                    '이 날은 가족 모두가 처음으로 함께 사진을 찍은 날이야. 너희들의 환한 웃음과 함께 정말 행복한 순간이었지. 앞으로도 소중한 추억을 많이 남기고 싶구나. 😊 우리 가족 사랑해!'),
                SizedBox(height: 10.h),
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
                            color: ColorSystem.brandGrey1,
                          ),
                          width: 155.w,
                          height: 130.h,
                          child: Center(
                            child: Text(
                              '+3 view more',
                              style: FontSystem.KR15R
                                  .copyWith(color: Colors.white),
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
                SizedBox(height: 20),
                Container(
                  width: 390.w,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      FutureBuilder<List<Map<String, dynamic>>>(
                        future: commentsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('댓글을 불러오는 데 실패했습니다.');
                          } else {
                            return Text(
                              '댓글 수: ${snapshot.hasData ? snapshot.data!.length : 0}개',
                              style: FontSystem.KR12R
                                  .copyWith(color: ColorSystem.brandGrey2),
                              textAlign: TextAlign.left,
                            );
                          }
                        },
                      ),
                      SizedBox(height: 10.h),
                      FutureBuilder<List<Map<String, dynamic>>>(
                        future: commentsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('댓글을 불러오는 데 실패했습니다.');
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Text('댓글이 없습니다.');
                          } else {
                            return Column(
                              children: snapshot.data!.map((commentData) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage(commentData['image']),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(commentData['name'],
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(commentData['comment']),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          hintText: '댓글을 입력하세요',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        String comment = _commentController.text;
                        await commentViewModel.saveComment(comment);
                        _commentController.clear(); // 입력 필드 초기화
                        _refreshComments(); // 댓글 목록 새로 고침
                      },
                      icon: SvgPicture.asset('assets/image/send.svg'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
