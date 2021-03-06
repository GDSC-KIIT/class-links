import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../firebase/repository/firestore_service.dart';
import '../hive/repository/hive_database.dart';

// TODO: [01]
mixin FirstYearPreviousUserPatchMixin {
  List<String> get _firstYearScheme1 =>
      List.generate(27, (index) => "A${index + 1}");

  List<String> get _firstYearScheme2 =>
      List.generate(30, (index) => "B${index + 1}");

  Future<void> get firstYearPreviousUserPatchMixin async {
    final hiveDatabase = Get.find<HiveDatabase>();
    final userInfo = hiveDatabase.userBox.userInfo;
    if (userInfo != null) {
      
      // if (_firstYearScheme1.contains(userInfo.batch)) {
      // } else if (_firstYearScheme2.contains(userInfo.batch)) {
      //   await _recreateUser(hiveDatabase);
      // }
    }
  }

  Future<void> _recreateUser(HiveDatabase hiveDatabase) async {
    await Get.find<FirestoreService>()
        .userInfoDatasources
        .deleteUser(hiveDatabase.userBox.userInfo!);
    await hiveDatabase.userBox.clearUserInfo;

    Get.offAllNamed(Routes.USER_BATCH);
  }
}
