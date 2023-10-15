import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class Comparison extends StatefulWidget {
  const Comparison({Key? key}) : super(key: key);

  @override
  _ComparisonState createState() => _ComparisonState();
}

class _ComparisonState extends State<Comparison> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Comparison"),
    );
  }
}
