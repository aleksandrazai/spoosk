import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
