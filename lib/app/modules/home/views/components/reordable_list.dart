import 'package:animations/animations.dart';
import '../../../subject_info/controllers/subject_info_controller.dart';
import '../../../subject_info/views/subject_info_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import '../../../../models/time_table/time_table.dart';
import '../../controllers/home_controller.dart';
import '../../../../utils/color.dart';
import '../../../../utils/extension.dart';
import 'current_class_card.dart';
import 'edit_model_sheet.dart';

class MyReordableLIst extends StatelessWidget {
  final HomeController homeController;
  final int currentTabIndex;
  final Day currentDay;
  const MyReordableLIst({
    Key? key,
    required this.homeController,
    required this.currentTabIndex,
    required this.currentDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ImplicitlyAnimatedReorderableList<Subject>(
        physics: const BouncingScrollPhysics(),
        areItemsTheSame: (a, b) => a.subjectName == b.subjectName,
        onReorderFinished: (a, b, c, d) =>
            homeController.finishReorder(a, b, c, d, currentDay.day),
        items: currentDay.subjects,
        itemBuilder: (context, animation, item, index) => Reorderable(
          key: ValueKey(item),
          builder: (context, dragAnimation, inDrag) => SizeFadeTransition(
            animation: animation,
            sizeFraction: 0.7,
            curve: Curves.easeInOut,
            child: AnimatedSize(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 200),
              child: AnimatedBuilder(
                  animation: dragAnimation,
                  builder: (context, child) => Obx(
                        () => homeController.editMode.value
                            ? editModeTile(context, inDrag, item)
                            // : true
                            : (item.startTime.isCurrentTime &&
                                    (currentTabIndex ==
                                        DateTime.now().weekday - 1))
                                ? CurrentClassCard(item: item)
                                : displayTile(context, item),
                      )),
            ),
          ),
        ),
        footer: Obx(
          () => !homeController.editMode.value
              ? const SizedBox()
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: ElevatedButton(
                    onPressed: () => addSubject(context),
                    child: const Text('Add Subject'),
                  ),
                ),
        ),
      );

  Widget editModeTile(BuildContext context, bool inDrag, Subject item) => Card(
        color: inDrag
            ? Theme.of(context).secondaryHeaderColor
            : BlendColor.cardColor(context),
        elevation: inDrag ? 2 : .5,
        child: ListTile(
          leading: Handle(
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.drag_indicator,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          title: Text(item.subjectName),
          subtitle: Text(item.startTime.text12HourStartEnd),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => homeController.removeSubject(item, currentDay.day),
          ),
          onTap: () => addSubject(context, item),
        ),
      );

  Widget displayTile(BuildContext context, Subject item) => OpenContainer(
        closedColor: Theme.of(context).scaffoldBackgroundColor,
        openColor: Theme.of(context).scaffoldBackgroundColor,
        middleColor: Theme.of(context).scaffoldBackgroundColor,
        closedBuilder: (context, action) => Theme(
          data: Theme.of(context).copyWith(
              cardColor: Colors.transparent,
              listTileTheme: ListTileThemeData(
                tileColor: Theme.of(context).backgroundColor,
              )),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Text(item.startTime.hourString,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).colorScheme.primary)),
            ),
            title: Hero(tag: "subject_name", child: Text(item.subjectName)),
            subtitle: displayTileText(item) != ""
                ? Text(displayTileText(item))
                : null,
            trailing: item.roomNo == null
                ? null
                : Text(
                    item.roomNo.toString(),
                    style: Get.theme.textTheme.headline4,
                  ),
            onLongPress: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text(item.remark == "" ? "No Remark" : item.remark))),
            onTap: action,
          ),
        ),
        openBuilder: (context, action) {
          Get.lazyPut<SubjectInfoController>(
            () => SubjectInfoController(),
            tag: SubjectInfoController.TAG,
          );
          return SubjectInfoView(subject: item);
        },
      );

  String displayTileText(Subject item) {
    List<String> subtitle = [];
    if (item.googleClassRoomLink != "") subtitle.add("Google Meet");
    if (item.zoomLink != "") subtitle.add("Zoom Meet");
    if (item.roomNo != null) subtitle.add("Room No ${item.roomNo}");
    return subtitle.join(" | ");
  }

  Future<void> addSubject(BuildContext context, [Subject? _subject]) async {
    final editBottomSheet = EditBottomSheet();
    Subject? sub = await editBottomSheet.show(context, _subject);
    if (sub != null) {
      if (_subject != null) {
        homeController.updateSubject(currentDay.day, _subject, sub);
      } else {
        homeController.addSubject(currentDay, sub);
      }
    }
  }
}
