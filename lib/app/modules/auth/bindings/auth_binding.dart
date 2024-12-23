import 'package:get/get.dart';

import 'package:cakrawala_app/app/modules/auth/controllers/login_controller.dart';
import 'package:cakrawala_app/app/modules/auth/controllers/register_controller.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
