import 'package:search_devs/data/implementations/dev_api_impl.dart';

class DevController {

  final DevApiImpl _devApiImpl = DevApiImpl();

  Future<void> getDev(String userName) async {
    _devApiImpl.getDev(userName);
  }



}