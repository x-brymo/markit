import 'package:get/get.dart';

import 'export.dart';

void getSingleRoute() {
  String routeName = '/home';
  
  GetPage? page = routeName.router;  // This will return the GetPage for '/home'
  print('Page name: ${page.name}');
  print('Page widget: ${page.page}');
}


void getRouteList() {
  String routeName = '/details';

  List<GetPage> pages = routeName.routerList;  // This will return a list of matching GetPages
  if (pages.isNotEmpty) {
    for (var page in pages) {
      print('Page name: ${page.name}');
      print('Page widget: ${page.page}');
    }
  } else {
    print('No routes found');
  }
}

 void navigateToRoute(String routeName) {
    final page = routeName.router; // Use the router getter

    Get.to(page.page()); // Navigate to the page if found
    }
