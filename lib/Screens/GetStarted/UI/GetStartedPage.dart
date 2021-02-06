import 'package:exeappgetsrt/Screens/GetStarted/Widgets/1Body.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatefulWidget {
  GetStartedPage({Key key}) : super(key: key);

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  String name;
  bool checkValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(context),
    );
  }
}
