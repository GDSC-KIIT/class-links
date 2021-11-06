import 'package:class_link/app/modules/rutine/views/categoriesscroller_widget.dart';
import 'package:class_link/app/modules/rutine/views/rutinecontainer_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rutine_controller.dart';

class RutineView extends GetView<RutineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
          child: Text(
            'Schedule',
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
            child: IconButton(
              icon: Icon(
                Icons.add,
                size: 39,
              ),
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Subject',
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // AddingRutineFormWidget(
                      //   onChangedTitle: (title) => setState(() {
                      //     this.title = title;
                      //   }),
                      //   onChangedDescription: (description) => setState(() {
                      //     this.description = description;
                      //   }),
                      //   onSavedTodo: () {},
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          CategoriesScroller(),
          rutineWidget(),
          rutineWidget(),
          rutineWidget(),
        ],
      ),
    );
  }
}
