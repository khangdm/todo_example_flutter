import 'package:flutter/material.dart';
import 'package:todoey/constances.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var totalTask = 0;
  List<bool> listTodoCheck = [false];

  var _expandHeight = 0.0;
  var _isExpand = false;

  void _incrementCounter() {
    setState(() {
      if (_isExpand) {
        _expandHeight = 0.0;
      } else {
        _expandHeight = 250.0;
      }
      _isExpand = !_isExpand;
    });
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
                child: Stack(children: [
              Container(
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
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  width: double.infinity,
                  height: _expandHeight,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  duration: Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                  child: Text("asdfh"),
                ),
              )
            ]))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[300],
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
