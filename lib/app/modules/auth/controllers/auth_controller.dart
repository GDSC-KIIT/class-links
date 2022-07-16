import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth/auth_service.dart';
import '../../../services/firebase/repository/firestore_service.dart';
import '../../../services/hive/hive_database.dart';
import '../../../utils/app_update.dart';

class AuthController extends GetxController {
  final loading = RxBool(false);

  @override
  void onReady() {
    AndroidAppUpdate();
    super.onReady();
  }

  Future<void> login() async {
    loading.value = true;
    final result = await Get.find<AuthService>().login;
    if (result == UserType.user) {
      final hiveDatabase = Get.find<HiveDatabase>();
      if (hiveDatabase.userInfo == null) {
        final userInfo =
            await Get.find<FirestoreService>().userInfoDatasources.getUserInfo;
        if (userInfo != null) {
          hiveDatabase.userInfo = userInfo;
          await hiveDatabase.setUserInfo(userInfo);
        }
      }

      // final userSection =
      //     await Get.find<FirestoreService>().electiveDatasources.getUserSection;
      // if (userSection != null) {
      //   await autoCreateUserFor3rdYear(userSection);
      // } else {
      hiveDatabase.userInfo == null
          ? Get.offNamed(Routes.USER_BATCH)
          : Get.offNamed(Routes.HOME);
      // }
    } else if (result == UserType.kiitian || result == UserType.guest) {
      Get.offNamed(Routes.HOME);
    }
    loading.value = false;
  }
}
