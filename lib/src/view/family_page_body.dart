import 'package:flutter/material.dart';

class FamilyPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '우리 가족 구성도',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('우리 가족의 구성도예요. 우측 상단의 링크 복사를 통해 아직 참여하지 않은 가족들을 더 초대해보세요!'),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: CustomPaint(
              size: Size(double.infinity, 200),
              painter: FamilyTreePainter(),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildFamilyMember('assets/image/fa5.png', '홍아빠'),
                        SizedBox(width: 100),
                        _buildFamilyMember('assets/image/fa4.png', '김엄마'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildFamilyMember('assets/image/fa3.png', '홍딸'),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Text(
            '가족 구성도에 추가되지 않은 멤버',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text('아직 가족 구성도에 추가되지 않은 멤버를 가족 구성도에 추가하세요!'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/image/fa1.png'),
                  ),
                  SizedBox(height: 3),
                  Text('홍아들'),
                ],
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/image/fa2.png'),
                  ),
                  SizedBox(height: 3),
                  Text('홍언니'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFamilyMember(String imagePath, String name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: 3),
        Text(name),
      ],
    );
  }
}

class FamilyTreePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final startPoint1 = Offset(size.width / 4, 40);
    final endPoint1 = Offset(size.width / 2, 100);
    final startPoint2 = Offset(3 * size.width / 4, 40);
    final endPoint2 = Offset(size.width / 2, 100);

    final middlePoint = Offset(size.width / 2, 100);
    final daughterPoint = Offset(size.width / 2, 160);

    canvas.drawLine(startPoint1, endPoint1, paint);
    canvas.drawLine(startPoint2, endPoint2, paint);
    canvas.drawLine(middlePoint, daughterPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
