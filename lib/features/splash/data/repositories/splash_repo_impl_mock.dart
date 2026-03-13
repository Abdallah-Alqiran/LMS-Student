import 'package:dartz/dartz.dart';
import 'package:lms_student/core/services/remote/api_consumer.dart';
import 'package:lms_student/features/splash/data/model/check_auth_response_model.dart';
import 'package:lms_student/features/splash/domain/splash_repository.dart';

class SplashRepositoryImplMock implements SplashRepository {
  final ApiConsumer apiConsumer;

  SplashRepositoryImplMock({required this.apiConsumer});
  @override
  Future<Either<CheckAuthDataModel, String>> checkLogin() async {
    await Future.delayed(Duration(seconds: 5));
    // Success Case
    // return Left(CheckAuthDataModel(isActive: true, isVerified: true));

    // Account Inactive Case
    // return Left(CheckAuthDataModel(
    //   isActive: false,
    //   isVerified: true,
    // ));

    // Account Unverified Case
    // return Left(CheckAuthDataModel(
    //   isActive: true,
    //   isVerified: false,
    // ));

    // Authentication Failed Case
    return Right("Authentication failed");
  }
}
