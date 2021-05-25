import 'package:flutter/material.dart';
import 'package:todoey/constances.dart';

import 'add_task_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var totalTask = 0;
  List<bool> listTodoCheck = [false];
  void _showModelBottomSheet() {

    showModalBottomSheet(
        context: context,
        // when keyboard is show bootom sheet is not hide by keyboard
        isScrollControlled: true,
        isDismissible: false,
        builder: (context) => SingleChildScrollView(
            child:Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskData(),
            )
        ),
      backgroundColor: Colors.transparent
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 60, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Todoey',
                    style: kTextStyleCommon.copyWith(fontSize: 30),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '$totalTask tasks',
                    style: kTextStyleCommon.copyWith(fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 40, 40, 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: Colors.white),
                  width: double.infinity,
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Buy milk",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Checkbox(
                          value: listTodoCheck[0],
                          fillColor: MaterialStateProperty.all(Colors.black),
                          onChanged: (value) {
                            setState(() {
                              listTodoCheck[0] = !listTodoCheck[0];
                            });
                          })
                    ],
                  ),
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[300],
          onPressed: _showModelBottomSheet,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
