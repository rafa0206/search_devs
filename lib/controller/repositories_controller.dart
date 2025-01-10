import 'package:search_devs/data/implementations/repositories_api_impl.dart';

class RepositoriesController {

  final RepositoriesApiImpl _repositoriesApiImpl = RepositoriesApiImpl();

  Future<void> getRepositoriesByUser(String userName) async {
    _repositoriesApiImpl.getRepositoriesByUser(userName);
  }

}