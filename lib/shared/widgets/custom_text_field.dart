import 'package:balonsistem/shared/constants/colors.dart';
import 'package:balonsistem/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InpuTextBox extends StatefulWidget {
  final Color? boxbcgcolor;
  final Color? boxbordercolor;
  final double? boxcornerradius;
  final double? fontsize;
  final double? boxwidth;
  final double? boxborderwidth;
  final double? boxheight;
  final EdgeInsets? contentpadding;
  final double? letterspacing;
  final double? leftrightmargin;
  final TextEditingController? controller;
  final String? Function(String? val)? validator;
  final Function(String? val)? onSaved;
  final Function(String val)? onchanged;
  final TextInputType? keyboardtype;
  final TextCapitalization? textCapitalization;
  final String? title;
  final String? subtitle;
  final String? hinttext;
  final String? placeholder;
  final int? maxLines;
  final int? minLines;
  final int? maxcharacters;
  final bool? isboldinput;
  final bool? obscuretext;
  final bool? autovalidate;
  final bool? disabled;
  final bool? showIconboundary;
  final Widget? sufficIconbutton;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? prefixIconbutton;
  final TextInputAction? textInputAction;

  const InpuTextBox(
      {super.key,
      this.controller,
      this.boxbordercolor,
      this.boxheight,
      this.fontsize,
      this.leftrightmargin,
      this.letterspacing,
      this.boxwidth,
      this.boxcornerradius,
      this.boxbcgcolor,
      this.hinttext,
      this.boxborderwidth,
      this.onSaved,
      this.textCapitalization,
      this.onchanged,
      this.contentpadding,
      this.placeholder,
      this.showIconboundary,
      this.subtitle,
      this.disabled,
      this.keyboardtype,
      this.inputFormatter,
      this.validator,
      this.title,
      this.maxLines,
      this.autovalidate,
      this.prefixIconbutton,
      this.maxcharacters,
      this.isboldinput,
      this.obscuretext,
      this.sufficIconbutton,
      this.minLines,
      this.textInputAction});
  @override
  _InpuTextBoxState createState() => _InpuTextBoxState();
}

class _InpuTextBoxState extends State<InpuTextBox> {
  bool isobscuretext = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      isobscuretext = widget.obscuretext ?? false;
    });
  }

  changeobscure() {
    setState(() {
      isobscuretext = !isobscuretext;
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Align(
      child: Container(
        margin: EdgeInsets.fromLTRB(
            widget.leftrightmargin ?? 8, 10, widget.leftrightmargin ?? 8, 10),
        width: widget.boxwidth ?? w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.title == null
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 7, 4),
                    child: TextSemiBold(
                      color: AppColors.instance.grey,
                      fontsize: 13,
                      text: widget.title ?? 'Group',
                    ),
                  ),
            widget.subtitle != null
                ? const SizedBox(height: 4)
                : const SizedBox(height: 0),
            SizedBox(
              // color: Colors.white,
              // height: widget.boxheight ?? 50,
              // decoration: BoxDecoration(
              //     color: widget.boxbcgcolor ?? Colors.white,
              //     border: Border.all(
              //         color:
              //             widget.boxbordercolor ?? AppColors.grey.withOpacity(0.2),
              //         style: BorderStyle.solid,
              //         width: 1.8),
              //     borderRadius: BorderRadius.all(
              //         Radius.circular(widget.boxcornerradius ?? 5))),
              child: TextFormField(
                minLines: widget.minLines,
                maxLines: widget.maxLines ?? 1,
                controller: widget.controller,
                obscureText: isobscuretext,
                onSaved: widget.onSaved ?? (val) {},
                readOnly: widget.disabled ?? false,
                onChanged: widget.onchanged ?? (val) {},
                maxLength: widget.maxcharacters,
                validator: widget.validator,
                keyboardType: widget.keyboardtype,
                autovalidateMode: widget.autovalidate == true
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                inputFormatters: widget.inputFormatter ?? [],
                textCapitalization:
                    widget.textCapitalization ?? TextCapitalization.sentences,
                style: TextStyle(
                  letterSpacing: widget.letterspacing,
                  fontSize: widget.fontsize ?? 15,
                  fontWeight: widget.isboldinput == true
                      ? FontWeight.w600
                      : FontWeight.w400,
                  height: 1.3,
                  // fontFamily:
                  //     widget.isboldinput == true ? 'NotoBold' : 'NotoRegular',
                  color: AppColors.instance.black,
                ),
                textInputAction: widget.textInputAction,
                decoration: InputDecoration(
                    prefixIcon: widget.prefixIconbutton != null
                        ? Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    width: widget.boxborderwidth ?? 1.5,
                                    color: widget.showIconboundary == true ||
                                            widget.showIconboundary == null
                                        ? AppColors.instance.greylightcolor
                                        : Colors.transparent),
                              ),
                              // color: Colors.white,
                            ),
                            margin: const EdgeInsets.only(
                                left: 2, right: 5, top: 2, bottom: 2),
                            // height: 45,
                            alignment: Alignment.center,
                            width: 50,
                            child: widget.prefixIconbutton)
                        : null,
                    suffixIcon: widget.sufficIconbutton != null ||
                            widget.obscuretext == true
                        ? Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                    width: widget.boxborderwidth ?? 1.5,
                                    color: widget.showIconboundary == true ||
                                            widget.showIconboundary == null
                                        ? AppColors.instance.greylightcolor
                                        : Colors.transparent),
                              ),
                              // color: Colors.white,
                            ),
                            margin: const EdgeInsets.only(
                                left: 2, right: 5, top: 2, bottom: 2),
                            // height: 45,
                            alignment: Alignment.center,
                            width: 50,
                            child: widget.sufficIconbutton ??
                                (widget.obscuretext == true
                                    ? IconButton(
                                        icon: Icon(
                                            isobscuretext == true
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: AppColors.instance.greytext),
                                        onPressed: () {
                                          changeobscure();
                                        })
                                    : null))
                        : null,
                    filled: true,
                    fillColor: widget.boxbcgcolor ?? Colors.white,
                    enabledBorder: OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderRadius:
                          BorderRadius.circular(widget.boxcornerradius ?? 6.r),
                      borderSide: BorderSide(
                          color: widget.boxbordercolor ??
                              AppColors.instance.greylightcolor,
                          width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderRadius:
                          BorderRadius.circular(widget.boxcornerradius ?? 6.r),
                      borderSide: BorderSide(
                          color: AppColors.instance.primary, width: 1.5),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            widget.boxcornerradius ?? 6.r),
                        borderSide: BorderSide(color: AppColors.instance.grey)),
                    contentPadding: widget.contentpadding ??
                        EdgeInsets.only(
                            top: 15.w, bottom: 15.w, left: 20.w, right: 20.w),
                    // labelText: 'Password',
                    hintText: widget.hinttext ?? '',
                    // fillColor: widget.boxbcgcolor ?? Colors.white,

                    hintStyle: TextStyle(
                        letterSpacing: widget.letterspacing ?? 1.5,
                        color: AppColors.instance.greytext,
                        fontSize: 14,
                        fontWeight: FontWeight.w300)),
              ),
            ),
            widget.subtitle == null
                ? const SizedBox(height: 0)
                : Padding(
                    padding: const EdgeInsets.fromLTRB(4, 6, 7, 2),
                    child: TextRegular(
                      fontsize: 12,
                      lineheight: 1.2,
                      color: AppColors.instance.greytext,
                      text: widget.subtitle ?? 'Sub - Title',
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
