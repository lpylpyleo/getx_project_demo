import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:getx_project_demo/app/middlewares/model_converter.dart';
import 'package:http/io_client.dart' as io;

class AppHttpClient extends ChopperClient {
  static late AppHttpClient _client;
  static get client => _client;
  // factory HttpClient() => init();
  AppHttpClient._()
      : super(
          client: io.IOClient(
            HttpClient()..connectionTimeout = const Duration(seconds: 10),
          ),
          // https://github.com/HackerNews/API
          baseUrl: "https://hacker-news.firebaseio.com/v0/",
          converter: ModelConverter(),
        );

  static bool _inited = false;

  /// Must be called before using this client
  static init() {
    if (!_inited) {
      _client = AppHttpClient._();
      _inited = true;
    }
  }
}
