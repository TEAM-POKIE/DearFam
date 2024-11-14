import 'package:dearfam/core/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  final String firstImage;
  final String? secondimage;

  AppBarView({required this.firstImage, this.secondimage});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorSystem.brandMainColor2,
      scrolledUnderElevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/image/DearFamFontLogo.svg'),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomIconButton(image: firstImage, onPressed: () {}),
              if (secondimage != null)
                CustomIconButton(image: secondimage!, onPressed: () {})
              else
                Container()
            ],
          )
        ],
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomIconButton extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;

  CustomIconButton({required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(image),
      onPressed: onPressed,
    );
  }
}
