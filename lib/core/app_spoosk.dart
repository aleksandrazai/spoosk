import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/levels.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/months.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/regions.dart';
import 'package:spoosk/core/generated/l10n.dart';
import 'package:spoosk/core/presentation/bloc_by_id/resort_by_id_bloc.dart';
import 'package:spoosk/core/presentation/bloc_region/region_bloc.dart';
import 'package:spoosk/core/presentation/blocs_init/bloc/request_controller_bloc.dart';
import 'package:spoosk/core/presentation/routes.dart';
import 'package:spoosk/core/presentation/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpooskApp extends StatefulWidget {
  const SpooskApp({super.key});

  @override
  State<SpooskApp> createState() => _SpooskAppState();
}

class _SpooskAppState extends State<SpooskApp> {
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MultiProvider(
        providers: [
          BlocProvider(
            create: (context) => RequestControllerBloc(),
          ),
          BlocProvider(
            create: (context) => ResortByIdBloc(),
          ),
          BlocProvider(
            create: (context) => RegionBloc(),
          ),
          ChangeNotifierProvider(
            create: (context) => SelectedRegionsModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => SelectedMonthsModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => SelectedLevelsModel(),
          ),
        ],
        child: MaterialApp.router(
          theme: CustomTheme.lightTheme,
          // darkTheme: CustomTheme.darkTheme,
          themeMode: ThemeMode.system,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          routerConfig: appRouter.config(),
        ));
  }
}
