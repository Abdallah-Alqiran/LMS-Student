import 'package:lms_student/features/home/data/model/course_model.dart';

class ResponseCourseModel {
  final bool success;
  final int? status;
  final String message;
  final List<CourseModel> data;

  ResponseCourseModel({
    required this.success,
    this.status,
    required this.message,
    required this.data,
  });

  factory ResponseCourseModel.fromJson(Map<String, dynamic> json) {
    return ResponseCourseModel(
      success: json['success'] ?? false,
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<CourseModel>.from(
              json['data'].map((x) => CourseModel.fromJson(x)),
            )
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status': status,
      'message': message,
      'data': data.map((x) => x.toJson()).toList(),
    };
  }
}
