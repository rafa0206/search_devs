import 'package:search_devs/data/api/dev_api.dart';
import 'package:search_devs/domain/entities/dev.dart';
import 'package:search_devs/domain/repositories/api_repositories/dev_api_repository.dart';

class DevApiImpl implements DevApiRepository{

  final DevApi _devApi = DevApi();

  @override
  Future<Dev> getDev(String userName) {
    return _devApi.getDev(userName);
  }

}