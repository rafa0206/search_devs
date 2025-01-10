import 'package:search_devs/domain/entities/repository.dart';

abstract class RepositoriesApiRepository{

  Future<List<Repository>> getRepositoriesByUser(String userName);

}