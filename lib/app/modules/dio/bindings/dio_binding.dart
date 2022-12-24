import 'package:get/get.dart';

import '../controllers/dio_controller.dart';

class DioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioController>(
      () => DioController(),
    );
  }
}
