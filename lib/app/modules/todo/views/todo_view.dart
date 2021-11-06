import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  int selectedIndex = 0;
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
          child: Text(
            'AEC',
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff8829C2),
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) {},
        // onTap: (index) => setState(() {
        //   selectedIndex = index;}

        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fact_check_outlined,
            ),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
              size: 28,
            ),
            label: 'Completed',
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xff8829C2),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 1,
                    color: Color(0xff43036a),
                  ),
                  BoxShadow(
                    offset: Offset(-2, 2),
                    blurRadius: 2,
                    color: Color(0xff43036a),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Class Link',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline5!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              )),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.copy_outlined,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text(
                      'Join Now',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .button!
                          .copyWith(color: Color(0xff8829C2)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Todo",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline5!
                          .copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          )),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(icon: Icon(Icons.add), onPressed: () {}),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Todo',
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
                const SizedBox(
                  height: 8,
                ),
                // TodoFormWidget(
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
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;
  const TodoFormWidget(
      {this.title = '',
      this.description = '',
      required this.onChangedTitle,
      required this.onSavedTodo,
      required this.onChangedDescription});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(
              height: 8,
            ),
            buildDescription(),
            SizedBox(
              height: 32,
            ),
            buildbutton(context),
          ],
        ),
      );
  Widget buildTitle() => TextFormField(
        maxLines: 2,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'Title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );
  Widget buildDescription() => TextFormField(
        maxLines: 1,
        initialValue: description,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'Title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Time',
        ),
      );
  Widget buildbutton(context) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: onSavedTodo,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff8829C2)),
            ),
            child: Text(
              'Save',
              style: Theme.of(context).primaryTextTheme.button,
            )),
      );
}
