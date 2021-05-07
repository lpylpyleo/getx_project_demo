import 'package:getx_project_demo/app/data/models/user_model.dart';
import 'package:getx_project_demo/app/data/services/user_service/user_service.dart';

class UserRepository {
  final service = UserService.create();

  Future<User?> getId(String id) async {
    var resp = await service.getUser(id);
    return resp.body;
  }
}
