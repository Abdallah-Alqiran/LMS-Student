import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lms_student/core/errors/handle_dio_exception.dart';
import 'package:lms_student/core/services/remote/api_consumer.dart';
import 'package:lms_student/core/services/remote/endpoints.dart';
import 'package:lms_student/features/splash/data/model/check_auth_response_model.dart';
import 'package:lms_student/features/splash/domain/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  final ApiConsumer apiConsumer;

  SplashRepositoryImpl({required this.apiConsumer});
  @override
  Future<Either<CheckAuthDataModel, String>> checkLogin() async {
    try {
      final response = await apiConsumer.get(EndPoint.checkAuth);
      final checkAuthResponseModel = CheckAuthResponseModel.fromJson(response);
      if (checkAuthResponseModel.data != null) {
        return Left(checkAuthResponseModel.data!);
      } else {
        return Right(checkAuthResponseModel.message!);
      }
    } on DioException catch (e) {
      return Right(DioExceptionHandler.handleException(e));
    } catch (e) {
      return Right(e.toString());
    }
  }
}