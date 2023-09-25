import 'package:flutter/material.dart';
import 'package:spoosk/core/generated/l10n.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(S.of(context).helloworld),
          ),
          TextButton(
            onPressed: () => throw Exception(),
            child: Text(S.of(context).testexception),
          ),
        ],
      ),
    );
  }
}
