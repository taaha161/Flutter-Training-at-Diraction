import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget implements PreferredSizeWidget {
  final backgroundcolor;
  final title;

  CustomBar({@required this.backgroundcolor, @required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: this.backgroundcolor,
      title: Text(
        this.title,
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      leading: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
