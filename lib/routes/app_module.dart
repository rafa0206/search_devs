import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_devs/ui/views/dev_view.dart';
import 'package:search_devs/ui/views/search_view.dart';

class AppModule extends Module {

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => SearchView());
    r.child('/profile', child: (context) => DevView());
  }

}