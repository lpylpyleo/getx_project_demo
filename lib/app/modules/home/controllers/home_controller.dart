import 'package:get/get.dart';
import 'package:getx_project_demo/app/data/models/user_model.dart';
import 'package:getx_project_demo/app/data/services/user_service/user_repository.dart';

class HomeController extends GetxController with StateMixin<User> {
  final UserRepository repo;
  HomeController(this.repo);

  final user = ''.obs;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    repo.getId('jl').then((value) {
      user.value = value?.toJson().toString() ?? '';
      change(value, status: RxStatus.success());
    }).catchError((e) {
      change(null, status: RxStatus.error(e.toString()));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
