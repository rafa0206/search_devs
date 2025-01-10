import 'package:search_devs/data/api/repositories_api.dart';
import 'package:search_devs/domain/entities/repository.dart';
import 'package:search_devs/domain/repositories/api_repositories/repositories_api_repository.dart';

class RepositoriesApiImpl implements RepositoriesApiRepository{

  final RepositoriesApi _repositoriesApi = RepositoriesApi();

  @override
  Future<List<Repository>> getRepositoriesByUser(String userName) {
    return _repositoriesApi.getRepositoriesByUser(userName);
  }

}