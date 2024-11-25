import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:marka/core/router/router.dart';

extension RouterExtension on String {
  GetPage get  router => AppRouter.router().firstWhere((element) => element.name == this);

  List<GetPage> get routerList => AppRouter.router().where((element) => element.name == this).toList();

}
// extension RouteExtension on GetPage {
//   GetPage get page => GetPage(name: name, page: () => page);
// } 
extension RoutersEX on AppRouter{
   AppRouter get router => AppRouter();
}