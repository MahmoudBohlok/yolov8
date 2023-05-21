import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      this.color,
       this.alignment,

      this.fontSize,
      this.lineHeight,
      this.height,
      this.textAlign,
      this.maxLine,
      this.overflow,
      this.style,
        this.left,
        this.right,
        this.top,
        this.bottom,
      this.fontFamily})
      : super(key: key);
  final String text;
  final Color? color;
  final double? fontSize;
  final double? lineHeight;
  final double? height;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final TextAlign? textAlign;
  final TextStyle? style;
  final int? maxLine;
  final AlignmentGeometry? alignment;

  final TextOverflow? overflow;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return
    Container(
          alignment: alignment??Alignment.center,
          margin:  EdgeInsets.only(
              left: left??0, right: right??0, top: top??0, bottom: bottom??0),
          child: Text( text,
              style: style??TextStyle(
                  fontFamily: fontFamily,
                  color: color,
                  fontSize: fontSize,
                  overflow: overflow,
                  height: height),  maxLines: maxLine,),

      );






  }
}
