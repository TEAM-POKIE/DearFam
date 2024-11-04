import 'package:flutter/material.dart';

class GoodsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        _buildCustomContainer(
          context,
          '우리 가족만의 추억 만들기',
          '앨범의 사진과 추억들을 통해 우리 가족만의 추억을 만들어보세요. 만들어진 굿즈는 책장에 추가됩니다.\n지금 바로 책장을 채워나가 보세요!',
        ),
        _buildCard(
          context,
          '흑백 사진을 컬러로 !',
          '흑백사진을 컬러 사진으로 바꿀 수 있어요. 오래된 사진에 생기를 더해보세요!',
          'assets/image/goods1.png',
        ),
        _buildCard(
          context,
          '사진을 동영상으로 !',
          'AI기술을 활용하여 사진을 영상으로 만들어요. 사진이 움직인다니? 너무 재밌지 않나요?',
          'assets/image/goods2.png',
        ),
        _buildCard(
          context,
          '사진 앨범 자동 제작',
          '사진을 마구잡이로 넣으면, AI가 테마, 중요도, 순서 등을 자동으로 맞춰 사진첩을 만들어줘요 !',
          'assets/image/goods3.png',
        ),
        _buildCard(
          context,
          '가족 동화책 제작',
          '사진을 마구잡이로 넣으면, AI가 테마, 중요도, 순서 등을 자동으로 맞춰 사진첩을 만들어줘요!',
          'assets/image/goods4.png',
        ),
        _buildCard(
          context,
          '디지털 액자 제작',
          '만들어진 굿즈를 디지털 액자로 만들어줘요. 추억을 가까이서 직접 볼 수 있어요',
          'assets/image/goods5.png',
        ),
      ],
    );
  }

  Widget _buildCard(
      BuildContext context, String title, String description, String goods) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      color: Color(0xffDDD5BF),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          trailing: Image.asset(goods),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(description),
        ),
      ),
    );
  }

  Widget _buildCustomContainer(
      BuildContext context, String title, String description) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
          SizedBox(height: 8.0),
          Text(description),
        ],
      ),
    );
  }
}
