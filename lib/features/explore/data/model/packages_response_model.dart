// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lms_student/features/explore/data/model/packages_model.dart';

class Packagesresponsemodel {
  bool success;
  int status;
  String message;
  List<PackagesModel> data;

  Packagesresponsemodel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory Packagesresponsemodel.fromJson(Map<String, dynamic> json) {
    return Packagesresponsemodel(
      success: json['success'] ?? '',
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List<PackagesModel>.from(
              json['data'].map((x) => PackagesModel.fromJson(x)),
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
