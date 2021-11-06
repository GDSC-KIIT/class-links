import 'package:class_link/app/modules/rutine/views/rutine_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  int selectedIndex = 0;
  String title = '';
  String description = '';
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              ' Servers',
              style: Theme.of(context).primaryTextTheme.headline4,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 15, 10),
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff8829C2))),
                onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Create',
                              style:
                                  Theme.of(context).primaryTextTheme.headline6,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            // ServerCreateFormWidget(
                            //   onChangedTitle: (title) => setState(() {
                            //     this.title = title;
                            //   }),
                            //   onChangedDescription: (description) =>
                            //       setState(() {
                            //     this.description = description;
                            //   }),
                            //   onChangeName: (name) => setState(() {
                            //     this.name = name;}
                            //   }),
                            //   onSavedTodo: () {},
                            // ),
                          ],
                        ),
                      ),
                    ),
                child: Text(
                  'Create',
                  style: Theme.of(context).primaryTextTheme.button,
                )),
          )
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
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Name',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .subtitle1!
                                .copyWith(color: Colors.white)),
                        SizedBox(
                          height: 18,
                        ),
                        Text('Email',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .subtitle1!
                                .copyWith(color: Colors.white)),
                        SizedBox(
                          height: 18,
                        ),
                        Text('Section',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .subtitle1!
                                .copyWith(color: Colors.white)),
                      ],
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("View",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline5!
                          .copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          )),
                ),
              ],
            ),
          ),
          serverWidget(),
          serverWidget(),
          serverWidget(),
          serverWidget(),
        ],
      ),
    );
  }
}

class serverWidget extends StatelessWidget {
  const serverWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Color(0x4C767679),
              ),
              BoxShadow(
                offset: Offset(-2, 4),
                blurRadius: 4,
                color: Color(0x4C767679),
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
                  'Server',
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Created By',
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Participants : 10',
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.to(RutineView());
                        },
                        child: Text('Join'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xff8829C2)))),
                    SizedBox(
                      width: 4,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.to(RutineView());
                        },
                        child: Text('View'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xff8829C2))))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
