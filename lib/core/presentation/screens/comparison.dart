import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Comparison extends StatefulWidget {
  const Comparison({super.key});

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
