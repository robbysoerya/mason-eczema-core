import 'package:dartz/dartz.dart';
import 'package:{{package_name}}/core/core.dart';
import 'package:{{package_name}}/core/domain/entities/{{feature_name.snakeCase()}}_entity.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  Future<Either<Failure, {{feature_name.pascalCase()}}Entity>> get{{feature_name.pascalCase()}}();
}
