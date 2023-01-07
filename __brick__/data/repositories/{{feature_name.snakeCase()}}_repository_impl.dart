import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:{{package_name}}/core/data/datasources/remote/{{feature_name.snakeCase()}}_remote_data_source.dart';
import 'package:{{package_name}}/core/domain/entities/{{feature_name.snakeCase()}}_entity.dart';
import 'package:{{package_name}}/core/domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import 'package:{{package_name}}/core/services/api_service.dart';
import 'package:{{package_name}}/core/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final {{feature_name.camelCase()}}RepositoryProvider =
    Provider.autoDispose<{{feature_name.pascalCase()}}Repository>((ref) {
  ref.onDispose(() {});
  return {{feature_name.pascalCase()}}RepositoryImpl(
    remoteDataSource: {{feature_name.pascalCase()}}RemoteDataSourceImpl(
      apiService: ApiService(),
    ),
    networkInfo: NetworkInfoImpl(
      dataConnectionChecker: InternetConnectionChecker(),
    ),
  );
});

class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  {{feature_name.pascalCase()}}RepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, {{feature_name.pascalCase()}}Entity>> get{{feature_name.pascalCase()}}() async {
    if (await networkInfo.isConnected) {
      try {
        final resp = await remoteDataSource.get{{feature_name.pascalCase()}}();
        return Right(resp);
      } on ServerFailure {
        return const Left(ServerFailure(''));
      } on SocketException catch (e) {
        return Left(SocketFailure(e.message));
      }
    } else {
      return const Left(ConnectionFailure('No Internet Connection'));
    }
  }
}
