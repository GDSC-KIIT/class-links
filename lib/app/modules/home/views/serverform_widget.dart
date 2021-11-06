import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ServerCreateFormWidget extends StatelessWidget {
  final String title;
  final String name;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangeName;
  final VoidCallback onSavedTodo;
  const ServerCreateFormWidget(
      {this.name = '',
      this.title = '',
      this.description = '',
      required this.onChangedTitle,
      required this.onSavedTodo,
      required this.onChangedDescription,
      required this.onChangeName});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(
              height: 8,
            ),
            buildName(),
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
        maxLines: 1,
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
  Widget buildName() => TextFormField(
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
          labelText: 'Name',
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
          labelText: 'Description',
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
              'Create',
              style: Theme.of(context).primaryTextTheme.button,
            )),
      );
}
