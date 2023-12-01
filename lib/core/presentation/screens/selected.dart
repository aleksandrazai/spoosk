import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class Selected extends StatefulWidget {
  const Selected({super.key});

  @override
  _SelectedState createState() => _SelectedState();
}

class _SelectedState extends State<Selected> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Selected"),
    );
  }
}
