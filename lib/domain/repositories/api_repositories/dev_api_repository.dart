import 'package:search_devs/domain/entities/dev.dart';

abstract class DevApiRepository{

  Future<Dev> getDev(String userName);

}