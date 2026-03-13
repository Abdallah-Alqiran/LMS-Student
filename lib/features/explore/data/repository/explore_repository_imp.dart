import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lms_student/core/errors/handle_dio_exception.dart';
import 'package:lms_student/core/services/remote/api_consumer.dart';
import 'package:lms_student/core/services/remote/endpoints.dart';
import 'package:lms_student/features/explore/data/model/packages_model.dart';
import 'package:lms_student/features/explore/domain/repositories/explore_repository.dart';

class ExploreRepositoryImp implements ExploreRepository {
  final ApiConsumer apiConsumer;
  ExploreRepositoryImp({required this.apiConsumer});
  @override
  Future<Either<List<PackagesModel>, String>> getAllPackages() async {
    try {
      final response = await apiConsumer.get(EndPoint.allPackages);
      List<PackagesModel> packages = [];
      print('📦 Response type: ${response.runtimeType}');
      print('📦 Response data: $response');
      if (response['data'] != null) {
        packages = (response['data'] as List)
            .map((package) => PackagesModel.fromJson(package))
            .toList();
      } else if (response is List) {
        packages = response
            .map((package) => PackagesModel.fromJson(package))
            .toList();
      }
      return Left(packages);
    } on DioException catch (e) {
      return Right(DioExceptionHandler.handleException(e));
    } catch (e) {
      return Right('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future<Either<PackagesModel, String>> getPackageBySlug(String slug) {
    // Implementation for fetching a package by its slug
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PackagesModel>, String>> searchInPackages(String query) {
    // Implementation for searching packages
    throw UnimplementedError();
  }
}
