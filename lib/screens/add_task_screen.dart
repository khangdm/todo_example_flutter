
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25)),
      ),
    );
  }
}
