import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: controller.obx(
          (state) => Text(
            controller.user.value,
            style: TextStyle(fontSize: 20),
          ),
          onError: (error) => Text(error ?? 'Error'),
        ),
      ),
    );
  }
}
