import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../global/const/const.dart';
import '../models/time_table/time_table.dart';
import '../models/user_info/user_info.dart';
import '../utils/get_snackbar.dart';
import 'package:get/get.dart';
import 'auth_service.dart';
import 'hive_database.dart';

class AppDataService extends GetxService {
  final hiveDatabase = Get.find<HiveDatabase>();

  // ---------------timeTable-----------------------//
  Stream<List<Day>> get batchTimeTableStream {
    return const Stream.empty();
    // live.client.subscribe(query).asStream().map((event) => event.query
    //     ? _defaultDays
    //     : TimeTable.fromJson(event.docs.first.data()).week);
    // .map((event) => event.docs.isEmpty
    //     ? _defaultDays
    //     : TimeTable.fromJson(event.docs.first.data()).week);
  }

  Future<void> addOrUpdateBatchTimeTable(TimeTable timeTable) async {
    final query = QueryBuilder<ParseObject>(ParseObject("time_table"))
      ..whereEqualTo("year", hiveDatabase.userInfo!.year)
      ..whereEqualTo("slot", hiveDatabase.userInfo!.slot)
      ..whereEqualTo("batch", hiveDatabase.userInfo!.batch);
    final result = await query.query();
    var data = ParseObject("time_table");
    timeTable.toJson().forEach((key, value) {
      data.set(key, value);
    });
    if (result.results?.isEmpty ?? false) {
      final response = await data.save();
      if (!response.success) {
        Message("Request Failed",
            response.error?.message ?? "Something went wrong!");
      }
    } else {
      data = data..objectId = result.results?.first?.objectId;
      await data.save();
    }
  }

  Stream<List<Day>> get personalTimeTableStream {
    return Stream.value(_defaultDays);
    // return _firestore
    //   .collection("personal_time_table")
    //   .where("creatorId", isEqualTo: Get.find<AuthService>().user!.emailAddress!)
    //   .snapshots()
    //   .map((event) => event.docs.isEmpty
    //       ? _defaultDays
    //       : TimeTable.fromJson(event.docs.first.data()).week);
  }

  Future<void> addOrUpdatePersonalTimeTable(TimeTable timeTable) async {
    final query = QueryBuilder<ParseObject>(ParseObject("personal_time_table"))
      ..whereEqualTo("creatorId", Get.find<AuthService>().user!.emailAddress!);
    final result = await query.query();
    var data = ParseObject("time_table");
    timeTable.toJson().forEach((key, value) {
      data.set(key, value);
    });
    ParseResponse response;
    if (result.results?.isEmpty ?? true) {
      response = await data.save();
    } else {
      data = data.objectId = result.results?.first.objectId;
      response = await data.save();
    }
    if (!response.success) {
      Message("Request Failed", response.error?.message);
    }
  }

  // -----------------userInfo----------------------//
  Future<UserInfo?> get getUserInfo async {
    try {
      final query = QueryBuilder<ParseObject>(ParseObject("user"))
        ..whereEqualTo("id", Get.find<AuthService>().user!.emailAddress)
        ..setLimit(1);
      final result = await query.query();
      if (result.results?.isEmpty ?? true) {
        return null;
      } else {
        return UserInfo.fromJson(result.results?.first);
      }
    } catch (e) {
      Message("unable to fetch user info", e.toString());
      return null;
    }
  }

  Future<bool> addUserInfo(UserInfo user) async {
    try {
      final query = QueryBuilder(ParseObject("user"))
        ..whereEqualTo("id", Get.find<AuthService>().user!.emailAddress)
        ..setLimit(1);
      final result = await query.query();
      var data = ParseObject("user");
      user.toJson().forEach((key, value) {
        data.set(key, value);
      });
      if (result.results?.isEmpty ?? true) {
        await data.save();
      } else {
        data.objectId = result.results?.first.userId;
        await data.save();
      }
      return true;
    } catch (e) {
      Message("Error", "Unable to add user : $e");
      return false;
    }
  }

  // -----------------userList----------------------//
  Future<List<UserInfo>> get userList async {
    final result = await ParseObject("user").getAll();
    return result.results
            ?.map(
              (e) => UserInfo.fromJson(e),
            )
            .toList() ??
        [];
  }

  Future<bool> updateUser(UserInfo user) async {
    final data = ParseObject("user");
    user.toJson().forEach((key, value) {
      data.set(key, value);
    });
    data.objectId = user.refId;
    final response = await data.save();
    if (response.success) {
      return response.success;
    } else {
      Message("Unable to update user", response.error?.message);
      return response.success;
    }
  }

  Future<List<UserInfo>> myBatch() async {
    final query = QueryBuilder(ParseObject("user"))
      ..whereEqualTo("batch", Get.find<HiveDatabase>().userInfo?.batch ?? "na");
    final userList = (await query.query())
            .results
            ?.map(
              (e) => UserInfo.fromJson(e),
            )
            .toList() ??
        [];
    final shortRolls = userList
        .where((element) => element.id.split("@").first.length == 7)
        .toList();
    shortRolls.sort((a, b) => a.id.compareTo(b.id));
    final longRolls = userList
        .where((element) => element.id.split("@").first.length == 8)
        .toList();
    longRolls.sort((a, b) => a.id.compareTo(b.id));
    return [...shortRolls, ...longRolls];
  }

  // -----------------utils----------------------//
  List<Day> get _defaultDays => List.generate(
        7,
        (index) => Day(day: Days.days[index], subjects: []),
      );
}
