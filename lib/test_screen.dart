import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_student/core/extensions/context_extensions.dart';
import 'package:lms_student/features/widgets/custom_outlined_button.dart';
import 'package:lms_student/features/widgets/custom_primary_button.dart';

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
                backgroundColor: context.colorScheme.secondary,
                textColor: context.colorScheme.onSecondary,
                icon: Icons.arrow_forward,
              ),
              CustomOutlinedButton(
                text: 'taste test outlined',
                isIconRight: false,
                icon: Icons.arrow_circle_down,
                iconPadding: 8.w,
                color: context.colorScheme.errorContainer,
                textColor: context.colorScheme.error,
                onTap: () {
                  print('Outlined Button tapped!');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
