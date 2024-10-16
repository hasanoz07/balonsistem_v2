import 'package:balonsistem/shared/constants/colors.dart';
import 'package:balonsistem/shared/constants/fonts.dart';
import 'package:flutter/material.dart';

class TextLight extends StatelessWidget {
  final String text; // text is now required
  final double? lineheight;
  final double? fontsize;
  final bool? isitalic;
  final Color? color;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final TextDirection? textdirection;
  final TextAlign? textalign;
  final int? maxlines;

  const TextLight({
    super.key,
    required this.text, // text is required
    this.isitalic,
    this.weight,
    this.color,
    this.fontsize,
    this.lineheight,
    this.textdirection,
    this.overflow,
    this.maxlines,
    this.textalign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text, // text is no longer nullable
      textDirection: textdirection ?? TextDirection.ltr,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxlines ?? 10,
      textAlign: textalign ?? TextAlign.left,
      style: TextStyle(
        fontSize: fontsize ?? 12,
        color: color ?? AppColors.instance.greylightcolor,
        height: lineheight ?? 1,
        fontFamily: AppFonts.LIGHT.value,
        fontWeight: weight ?? FontWeight.normal,
        fontStyle: isitalic == true ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}

class TextBold extends StatelessWidget {
  final String text; // text is now required
  final double? lineheight;
  final double? fontsize;
  final double? spacing;
  final bool? isitalic;
  final Color? color;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final TextDirection? textdirection;
  final TextAlign? textalign;
  final int? maxlines;

  const TextBold({
    super.key,
    required this.text, // text is required
    this.isitalic,
    this.weight,
    this.spacing,
    this.color,
    this.fontsize,
    this.lineheight,
    this.textdirection,
    this.overflow,
    this.maxlines,
    this.textalign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text, // text is no longer nullable
      textDirection: textdirection ?? TextDirection.ltr,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxlines ?? 10,
      textAlign: textalign ?? TextAlign.left,
      style: TextStyle(
        letterSpacing: spacing,
        fontSize: fontsize ?? 12,
        color: color ?? AppColors.instance.black,
        height: lineheight ?? 1,
        fontFamily: AppFonts.BOLD.value,
        fontWeight: weight ?? FontWeight.normal,
        fontStyle: isitalic == true ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}

class TextExtraBold extends StatelessWidget {
  final String text; // text is now required
  final double? lineheight;
  final double? fontsize;
  final bool? isitalic;
  final Color? color;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final TextDirection? textdirection;
  final TextAlign? textalign;
  final int? maxlines;

  const TextExtraBold({
    super.key,
    required this.text, // text is required
    this.isitalic,
    this.weight,
    this.color,
    this.fontsize,
    this.lineheight,
    this.textdirection,
    this.overflow,
    this.maxlines,
    this.textalign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text, // text is no longer nullable
      textDirection: textdirection ?? TextDirection.ltr,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxlines ?? 10,
      textAlign: textalign ?? TextAlign.left,
      style: TextStyle(
        fontSize: fontsize ?? 12,
        color: color ?? AppColors.instance.greylightcolor,
        height: lineheight ?? 1,
        fontFamily: AppFonts.EXTRA_BOLD.value,
        fontWeight: weight ?? FontWeight.normal,
        fontStyle: isitalic == true ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}

class TextSemiBold extends StatelessWidget {
  final String text; // text is now required
  final double? lineheight;
  final double? fontsize;
  final bool? isitalic;
  final Color? color;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final TextDirection? textdirection;
  final TextAlign? textalign;
  final int? maxlines;

  const TextSemiBold({
    super.key,
    required this.text, // text is required
    this.isitalic,
    this.weight,
    this.color,
    this.fontsize,
    this.lineheight,
    this.textdirection,
    this.overflow,
    this.maxlines,
    this.textalign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text, // text is no longer nullable
      textDirection: textdirection ?? TextDirection.ltr,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxlines ?? 10,
      textAlign: textalign ?? TextAlign.left,
      style: TextStyle(
        fontSize: fontsize ?? 12,
        color: color ?? AppColors.instance.greylightcolor,
        height: lineheight ?? 1,
        fontFamily: AppFonts.SEMI_BOLD.value,
        fontWeight: weight ?? FontWeight.normal,
        fontStyle: isitalic == true ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}

class TextRegular extends StatelessWidget {
  final String text; // text is now required
  final double? lineheight;
  final double? fontsize;
  final bool? isitalic;
  final Color? color;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final TextDirection? textdirection;
  final TextAlign? textalign;
  final int? maxlines;

  const TextRegular({
    super.key,
    required this.text, // text is required
    this.isitalic,
    this.weight,
    this.color,
    this.fontsize,
    this.lineheight,
    this.textdirection,
    this.overflow,
    this.maxlines,
    this.textalign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text, // text is no longer nullable
      textDirection: textdirection ?? TextDirection.ltr,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxlines ?? 10,
      textAlign: textalign ?? TextAlign.left,
      style: TextStyle(
        fontSize: fontsize ?? 12,
        color: color ?? AppColors.instance.greylightcolor,
        height: lineheight ?? 1,
        fontFamily: AppFonts.REGULAR.value,
        fontWeight: weight ?? FontWeight.normal,
        fontStyle: isitalic == true ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}
