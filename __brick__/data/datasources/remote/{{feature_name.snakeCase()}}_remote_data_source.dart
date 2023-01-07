import 'package:{{package_name}}/core/domain/entities/{{feature_name.snakeCase()}}_entity.dart';
import 'package:{{package_name}}/core/services/api_service.dart';

abstract class {{feature_name.pascalCase()}}RemoteDataSource {
  Future<{{feature_name.pascalCase()}}Entity> get{{feature_name.pascalCase()}}();
}

class {{feature_name.pascalCase()}}RemoteDataSourceImpl
    implements {{feature_name.pascalCase()}}RemoteDataSource {
  final ApiService apiService;

  {{feature_name.pascalCase()}}RemoteDataSourceImpl({required this.apiService});

  @override
  Future<{{feature_name.pascalCase()}}Entity> get{{feature_name.pascalCase()}}() async {
    final resp = await apiService.get{{feature_name.pascalCase()}}();
    return resp.toEntity();
  }
}
