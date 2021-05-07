import 'package:get/get.dart';
import 'package:getx_project_demo/app/data/services/user_service/user_repository.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(UserRepository()),
    );
  }
}
