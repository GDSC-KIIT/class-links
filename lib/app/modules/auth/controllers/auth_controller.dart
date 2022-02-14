import '../../../utils/app_update.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';
import '../../../services/parse_service.dart';
import '../../../services/hive_database.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final loading = RxBool(false);

  @override
  void onReady() {
    AndroidAppUpdate();
    super.onReady();
  }

  Future<void> login() async {
    loading.value = true;
    final result = await Get.find<AuthService>().login();
    if (result == UserType.user) {
      final hiveDatabase = Get.find<HiveDatabase>();
      if (hiveDatabase.userInfo == null) {
        final _userInfo = await Get.find<AppDataService>().getUserInfo;
        if (_userInfo != null) {
          hiveDatabase.userInfo = _userInfo;
          await hiveDatabase.setUserInfo(_userInfo);
        }
      }
      hiveDatabase.userInfo == null
          ? Get.offNamed(Routes.USER_BATCH)
          : Get.offNamed(Routes.HOME);
    } else if (result == UserType.kiitian || result == UserType.guest) {
      Get.offNamed(Routes.HOME);
    }
    loading.value = false;
  }
}
