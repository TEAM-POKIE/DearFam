import 'package:dearfam/core/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorSystem.brandMainlightColor,
      elevation: 0,
      title: SvgPicture.asset('assets/image/DearFamFontLogo.svg'),
      flexibleSpace: FlexibleSpaceBar(),
      actions: <Widget>[
        CustomIconButton(
          icon: Icons.settings,
          onPressed: () {},
        ),
        CustomIconButton(
          icon: Icons.notifications,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  CustomIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: Colors.grey[800]),
      onPressed: onPressed,
    );
  }
}
