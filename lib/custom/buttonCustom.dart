import 'package:flutter/material.dart';

class ButtonSPOT extends StatelessWidget {
  final Color color;
  final String title;
  final double fontSize;
  final Color fontColor;

  const ButtonSPOT({
    Key key,
    this.color = Colors.lightBlue,
    this.title,
    this.fontSize,
    this.fontColor = Colors.white,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        "$title",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
            fontFamily: "FontFavoritBold"),
      ),
    );
  }
}
