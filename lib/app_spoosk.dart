import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:spoosk/generated/l10n.dart';

class SpooskApp extends StatefulWidget {
  const SpooskApp({super.key});

  @override
  State<SpooskApp> createState() => _SpooskAppState();
}

class _SpooskAppState extends State<SpooskApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: Scaffold(
        body: Column(
          children: [
            Center(
              child: Text('Hello World!'),
            ),
            TextButton(
              onPressed: () => throw Exception(),
              child: const Text("Throw Test Exception"),
            ),
          ],
        ),
      ),
    );
  }
}
