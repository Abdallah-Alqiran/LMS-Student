import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_student/core/extensions/context_extensions.dart';
import 'package:lms_student/features/widgets/custom_outlined_button.dart';
import 'package:lms_student/features/widgets/custom_primary_button.dart';
import 'package:lms_student/features/widgets/custom_text_form_field.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPrimaryButton(
                text: 'taste test',
                onTap: () {
                  print('Button tapped!');
                },
                prefixIcon: Icon(Icons.arrow_circle_up, size: 20.w),
                suffixIcon: Icon(Icons.arrow_circle_down, size: 20.w),
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.secondary,
                  foregroundColor: context.colorScheme.onSecondary,
                ),
              ),

                SizedBox(height: 20),
              CustomOutlinedButton(
                text: 'taste test outlined',
                style: OutlinedButton.styleFrom(
                  foregroundColor: context.colorScheme.secondary,
                  backgroundColor: context.colorScheme.primary.withValues(alpha: 0.1),
                  side: BorderSide(
                    color: context.colorScheme.secondary,
                  ), 
                ),
                textStyle: context.textTheme.labelSmall,
                prefixIcon: Icon(Icons.arrow_circle_up),
                iconSize: 5.w,
                onTap: () {
                  print('Outlined Button tapped!');
                },
              ),

              SizedBox(height: 20),

              CustomTextFormField(
                hintText: 'hintText',
                prefixIcon: Icon(Icons.email_outlined, size: 20.w),
                suffixIcon: Icon(Icons.remove_red_eye, size: 20.w),
              ),

              SizedBox(height: 20),

              CustomTextFormField(hintText: 'password',prefixIcon: Icon(Icons.lock_clock_outlined, size: 20.w),isPassword: true,suffixIcon: Icon(Icons.remove_red_eye, size: 20.w),),
            ],
          ),
        ),
      ),
    );
  }
}
