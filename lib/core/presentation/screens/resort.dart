import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class Resort extends StatefulWidget {
  const Resort({Key? key}) : super(key: key);

  @override
  _ResortState createState() => _ResortState();
}

class _ResortState extends State<Resort> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("WORK")),
    );
  }
}
