import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  late String _myTitile;

  MyAppBar(this._myTitile);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return new AppBar(
      title: new Text(_myTitile),
    );
  }
}