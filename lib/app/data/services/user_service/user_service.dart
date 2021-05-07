import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:getx_project_demo/app/data/models/user_model.dart';
import 'package:getx_project_demo/app/middlewares/http_client.dart';

// This is necessary for the generator to work.
part "user_service.chopper.dart";

@ChopperApi(baseUrl: "/user")
abstract class UserService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  /// Use my own singleton client instance
  static UserService create() => _$UserService(AppHttpClient.client);

  @Get(path: '/{id}.json')
  Future<Response<User>> getUser(@Path() String id);

  // The following methods are only for demostrating purpose, not work.

  @Post()
  Future<Response<User>> postUser(@Body() Map<String, dynamic> user);

  @Delete(path: '/{id}')
  Future<Response> deleteUser(@Path() int id);
}
