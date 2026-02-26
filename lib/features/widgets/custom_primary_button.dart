import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_student/core/extensions/context_extensions.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool isIconRight;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? iconPadding; // space betweeen text and icon 
  

  const CustomPrimaryButton({
    super.key,
    required this.text,
    this.icon,
    this.isIconRight = true,
    this.backgroundColor,
    this.textColor,
    this.onTap,
    this.width,
    this.height,
    this.iconPadding,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = this.backgroundColor ?? context.colorScheme.primary;
    final Color textColor = this.textColor ?? context.colorScheme.onPrimary;

    return InkWell(
        onTap: onTap,
        
        child: Container(
          width: width!=null ? width!.w : 278.w,
          height: height!=null ? height!.h : 50.h,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
              mainAxisAlignment: .center,
              children: [
                if (icon != null && !isIconRight) ...[
                  Icon(icon, color: textColor,size: 16.sp,), 
                  SizedBox(width: iconPadding!=null ? iconPadding!.w : 8.w),
                ],
            
                Text(text,style: context.textTheme.labelLarge?.copyWith(color: textColor),),
            
                if (icon != null && isIconRight) ...[
                   SizedBox(width: iconPadding!=null ? iconPadding!.w : 8.w),
                  Icon(icon, color: textColor,size: 16.sp,),
                ]
                
              ],
            ),
          ),
      );
    
    
  }
}
