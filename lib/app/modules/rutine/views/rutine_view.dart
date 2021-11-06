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

class rutineWidget extends StatelessWidget {
  const rutineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: GestureDetector(
        onTap: () {
          // Get.to(AddingPage());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
          decoration: BoxDecoration(
              color: Color(0xff8829C2),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 2,
                  color: Color(0xff510481),
                ),
                BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 1,
                  color: Color(0xff510481),
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AEC',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1pm - 2pm',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool day = true;
    String s = "Thur";
    List<Widget> itemsData = [];
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              ContainerDay("Mon", s == "Mon", context),
              ContainerDay("Tue", s == "Tue", context),
              ContainerDay("Wed", s == "Wed", context),
              ContainerDay("Thur", s == "Thur", context),
              ContainerDay("Fri", s == "Fri", context),
              ContainerDay("Sat", s == "Sat", context),
              ContainerDay("Sun", s == "Sun", context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget ContainerDay(String s, bool day, context) {
  return Row(
    children: [
      Container(
        width: 45,
        height: 73,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (day) ? Color(0xff8829C2) : Colors.white,
        ),
        child: Center(
          child: Text(
            s,
            style: (day)
                ? Theme.of(context)
                    .primaryTextTheme
                    .subtitle1!
                    .copyWith(color: Colors.white)
                : Theme.of(context).primaryTextTheme.subtitle1,
          ),
        ),
      ),
      SizedBox(
        width: 30,
      ),
    ],
  );
}

class AddingRutineFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;
  const AddingRutineFormWidget(
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
