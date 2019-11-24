import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  GenderSelection({Key key}) : super(key: key);

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child:Container(
         child: Text('We will Add Gender here'),
       ),
    );
  }
}