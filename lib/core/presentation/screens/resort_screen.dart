import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResortScreen extends StatefulWidget {
  const ResortScreen({super.key});

  @override
  State<ResortScreen> createState() => _ResortScreenState();
}

class _ResortScreenState extends State<ResortScreen>
    with AutoRouteAwareStateMixin<ResortScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Resort Name'),
      ),
      body: Center(
        child: Text('Work'),
      ),
    );
  }
}
