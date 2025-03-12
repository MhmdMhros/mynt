import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? autoFocus;
  final bool? readOnly;
  final bool isBorderEnabled;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final Function(PointerDownEvent)? onTapOutside;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.controller,
    this.keyboardType,
    this.autoFocus,
    this.readOnly,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.isBorderEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      onTapOutside:
          onTapOutside != null ? (event) => onTapOutside!(event) : null,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
        focusedBorder: isBorderEnabled
            ? (focusedBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    4.r,
                  ),
                ))
            : InputBorder.none,
        enabledBorder: isBorderEnabled
            ? (enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8.r,
                  ),
                ))
            : InputBorder.none,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintStyle: hintStyle ??
            TextStyle(
              fontSize: 14.sp,
              color: AppColors.text2,
              fontFamily: 'Montserrat',
            ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: backgroundColor ?? AppColors.secondary,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: inputTextStyle,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: AppColors.primary,
      autofocus: autoFocus ?? false,
      readOnly: readOnly ?? false,
      focusNode: focusNode,
    );
  }
}
