import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_student/core/extensions/context_extensions.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscureText = false,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      keyboardType: keyboardType,
      validator: validator,
      // ستايل النص اللي بيتكتب
      style: context.textTheme.bodyMedium, 
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.textTheme.bodyMedium?.copyWith(
          color: Colors.grey, // أو اللون اللي في التصميم
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        
        // الخلفية البيضاء
        filled: true,
        fillColor: Colors.white,

        // الحدود في الحالة العادية
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r), // حسب الدوران في فيجما
          borderSide: BorderSide(
            color: Colors.grey.shade200, // لون البرواز الخفيف
            width: 1.w,
          ),
        ),

        // الحدود لما تضغطي على الحقل
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: context.colorScheme.primary, // لون البريماري لما يتفعل
            width: 1.w,
          ),
        ),

        // الحدود في حالة الخطأ
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}