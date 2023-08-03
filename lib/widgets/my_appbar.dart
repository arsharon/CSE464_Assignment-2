import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({super.key, required String titleText})
      : super(
          title: Text(titleText),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 5,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.transparent,
        );
}
