import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final String image;
  final Function onPressed;
  const BottomNav({
    Key key,
    this.image,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //kapsadığı alanı dokunmaya duyarlı hala getirir
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(image),
        ],
      ),
    );
  }
}
