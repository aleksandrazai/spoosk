import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:spoosk/core/generated/l10n.dart';
import 'package:spoosk/core/presentation/routes.dart';
import 'package:spoosk/core/presentation/theme/theme.dart';

class SpooskApp extends StatefulWidget {
  const SpooskApp({super.key});

  @override
  State<SpooskApp> createState() => _SpooskAppState();
}

class _SpooskAppState extends State<SpooskApp> {
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: appRouter.config(),
    );
  }
}
