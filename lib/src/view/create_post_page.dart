import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:dearfam/src/providers/page_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class CreatePostPage extends ConsumerStatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ConsumerState<CreatePostPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  Future<void> _pickImage() async {
    // 권한 요청
    if (await Permission.photos.request().isGranted) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
      });
    } else {
      // 권한이 거부된 경우 처리
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('갤러리 접근 권한이 필요합니다.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0.w),
              width: 300.0.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 15.h),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 270.w,
                      height: 280.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey[300],
                      ),
                      child: _image == null
                          ? Icon(Icons.add, size: 50)
                          : Image.file(File(_image!.path), fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: '제목을 입력하세요',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  TextField(
                    controller: _contentController,
                    decoration: InputDecoration(
                      hintText: '내용을 입력하세요',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            ref.read(pageProvider.notifier).togglePage();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(120.w, 40.h),
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            '취소',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            final title = _titleController.text;
                            final content = _contentController.text;
                            ref
                                .read(postProvider.notifier)
                                .addPost(title, content);
                            ref.read(pageProvider.notifier).togglePage();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(120.w, 40.h),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            '등록하기',
                            style: TextStyle(color: Colors.white),
                          ),
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
