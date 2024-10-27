import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

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
              color: Colors.white,
            ),
            child: Column(
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
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // 버튼 클릭 시 동작 추가
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(270.w, 40.h),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 24.w),
                      child: Text(
                        '추억 공유하러 가기',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
