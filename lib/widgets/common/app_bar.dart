import 'package:flutter/material.dart';

AppBar genericAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(
            height: 40,
            width: 40,
            child: Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
    centerTitle: true,
    elevation: 0,
    title: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    ),
  );
}
