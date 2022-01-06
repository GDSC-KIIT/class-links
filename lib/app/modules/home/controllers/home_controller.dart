import 'dart:async';
import 'package:class_link/app/global/const/const.dart';
import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:class_link/app/routes/app_pages.dart';
import 'package:class_link/app/services/firestore_service.dart';
import 'package:class_link/app/services/local_database.dart';
import 'package:class_link/app/utils/get_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;
  final week = Rx<List<Day>>([]);
  final editMode = false.obs;
  late final StreamSubscription<List<Day>> timeTableSubscription;
  List<Day> originalList = List.generate(
    7,
    (index) => Day(day: Days.days[index], subjects: []),
  );

  @override
  void onInit() async {
    tabController = TabController(
      initialIndex: DateTime.now().weekday - 1,
      vsync: this,
      length: 7,
    );
    _defaultDays();
    timeTableSubscription =
        Get.find<FirestoreService>().timeTableStream().listen((event) {
      week.value = List.generate(event.length, (index) => event[index]);
      originalList = _deepCopyWeek(event);
    });
    await getUserInfo();
    super.onInit();
  }

  void _defaultDays() => week.value = List.generate(
        7,
        (index) => Day(day: Days.days[index], subjects: []),
      );

  Future<UserInfo?> getUserInfo() async {
    final result = Get.find<HiveDatabase>().userInfo;
    if (result != null) {
      return result;
    } else {
      final result2 = await Get.find<FirestoreService>().getUserInfo();
      if (result2 != null) {
        await Get.find<HiveDatabase>().setUserInfo(result2);
        return result2;
      } else {
        Get.offNamed(Routes.USER_INFO);
      }
    }
    return null;
  }

  void cancleEditMode() {
    week.value = _deepCopyWeek(originalList);
    editMode.value = false;
  }

  void addSubject(Day day, Subject _subject) => week.update((val) =>
      week.value.firstWhere((e) => e.day == day.day).subjects.add(_subject));

  void updateSubject(String day, Subject _oldSubject, Subject _newSubject) {
    final _day = week.value.firstWhere((e) => e.day == day);
    week.update((val) => _day.subjects[_day.subjects
        .indexWhere((element) => element == _oldSubject)] = _newSubject);
  }

  void removeSubject(Subject subject, String day) => week.update((val) =>
      week.value.firstWhere((e) => e.day == day).subjects.remove(subject));

  void finishReorder(Subject _subject, int _from, int _to,
      List<Subject> _subjects, String day) {
    week.value.firstWhere((e) => e.day == day).subjects.clear();
    week.value.firstWhere((e) => e.day == day).subjects.addAll(_subjects);
  }

  void toggleEditMode() async {
    if (editMode.value) {
      if (_validate()) {
        await _addOrUpdateTimeTable();
        editMode.value = false;
      }
    } else {
      editMode.value = true;
    }
  }

  bool _validate() {
    for (final day in week.value) {
      for (int i = 1; i < day.subjects.length; i++) {
        final beforeSubTime = day.subjects[i - 1].startTime;
        final startingTime = day.subjects[i].startTime;
        if (((startingTime.hour * 60) + startingTime.minute) <
            ((beforeSubTime.hour * 60) + beforeSubTime.minute)) {
          Message(
            "Error",
            "Starting time should be greater than previous subject's ending time",
          );
          return false;
        }
      }
    }
    return true;
  }

  Future<void> _addOrUpdateTimeTable() async {
    final _userInfo = Get.find<HiveDatabase>().userInfo!;
    final timeTable = TimeTable(
      week: week.value,
      creatorId: _userInfo.id,
      batch: _userInfo.batch,
      year: _userInfo.year,
      slot: _userInfo.slot,
      date: DateTime.now(),
    );
    await Get.find<FirestoreService>().addOrUpdateTimeTable(timeTable);
  }

  List<Day> _deepCopyWeek(List<Day> originList) =>
      originList.map((e) => Day.fromJson(e.toJson())).toList();

  @override
  void onClose() {
    timeTableSubscription.cancel();
    super.onClose();
  }
}
