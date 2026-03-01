import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_student/core/extensions/context_extensions.dart';

class CourseCardHorizontal extends StatelessWidget {
  final String title;
  final String imagePath;
  final String instructorName;
  final String? nextLesson;
  final double? progressValue; 
  final int? progressPercentage;
  final double? width;
  final double? rating;
  

  const CourseCardHorizontal({
    super.key,
    required this.title,
    required this.imagePath,
    required this.instructorName,
    this.nextLesson,
    this.progressValue,
    this.progressPercentage, 
    this.width, 
    this.rating,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: width?.w ?? double.infinity,
      padding: EdgeInsets.all( 12.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r), 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image 
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  width: 80.w,
                  height: 80.w,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[200],
                    child: Icon(Icons.broken_image, size: 30.w),
                  ),
                ),
              ),
              SizedBox(width: 12.w),

            
              // title and instructor
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurface,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      instructorName,
                      style: context.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    

                    if(nextLesson != null) ...[
                      //SizedBox(height: 6.h),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Next: $nextLesson',
                          style: context.textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.colorScheme.primary,
                          ),
                        ),
                        
                      ],
                    ),
                    ],
                    
                    if(rating != null)Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20.w),
                            SizedBox(width: 2.w),
                            Text(
                              '$rating',
                              style: context.textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                  ],
                ),
              ),
            ],
          ),
          
          SizedBox(height: 16.h),

          // progress
          if (progressValue != null && progressPercentage != null) ...[
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Progress', style: context.textTheme.labelSmall),
                  Text('$progressPercentage%', style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: LinearProgressIndicator(
                  value: progressValue,
                  minHeight: 6.h,
                  backgroundColor: context.colorScheme.primary.withValues(alpha: 0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(context.colorScheme.primary),
                ),
              ),
            ],
          ),
          ]
        ],
      ),
    );
  }
}