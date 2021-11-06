import 'package:get/get.dart';

import '../controllers/rutine_controller.dart';

class RutineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RutineController>(
      () => RutineController(),
    );
  }
}
