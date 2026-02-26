import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_student/core/extensions/context_extensions.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool isIconRight;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? iconPadding; // space betweeen text and icon 
  final double? bgOpacity;
  final double? borderOpacity;
  
  const CustomOutlinedButton({
    super.key,
    required this.text,
    this.icon,
    this.isIconRight = true,
    this.color,
    this.textColor,
    this.onTap,
    this.width,
    this.height,
    this.iconPadding,
    this.bgOpacity,
    this.borderOpacity,
  });

  @override
  Widget build(BuildContext context) {

    final Color baseColor = color ?? context.colorScheme.primary;
    final Color bgColor = baseColor.withValues(alpha: bgOpacity ?? 0.0);
    final Color borderColor = baseColor.withValues(alpha: borderOpacity ?? 1.0);
    final Color textColor = this.textColor ?? borderColor;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          width: width != null ? width!.w : 278.w,
          height: height != null ? height!.h : 50.h,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: borderColor,
              width: 1.w, 
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null && !isIconRight) ...[
                Icon(icon, color: textColor, size: 16.sp),
                SizedBox(width: iconPadding != null ? iconPadding!.w : 8.w),
              ],
              
              Text(
                text,
                style: context.textTheme.labelLarge?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              if (icon != null && isIconRight) ...[
                SizedBox(width: iconPadding != null ? iconPadding!.w : 8.w),
                Icon(icon, color: textColor, size: 16.sp),
              ],
            ],
          ),
        ),
      ),
    );
    
  }
}
