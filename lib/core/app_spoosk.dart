import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/advanced_filter/all_filter_params.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/main_filter/levels.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/main_filter/months.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/main_filter/regions.dart';
import 'package:spoosk/core/data/models/user_id_notifier.dart';
import 'package:spoosk/core/generated/l10n.dart';
import 'package:spoosk/core/presentation/bloc_by_id/resort_by_id_bloc.dart';
import 'package:spoosk/core/presentation/bloc_login/login_bloc.dart';
import 'package:spoosk/core/presentation/bloc_mainFilter.dart/mainFilter_bloc.dart';
import 'package:spoosk/core/presentation/bloc_password_new.dart%20/new_password_bloc.dart';
import 'package:spoosk/core/presentation/bloc_password_reset.dart/reset_bloc.dart';
import 'package:spoosk/core/presentation/bloc_region/region_bloc.dart';
import 'package:spoosk/core/presentation/bloc_register/register_bloc.dart';
import 'package:spoosk/core/presentation/bloc_reviews/reviews_bloc.dart';
import 'package:spoosk/core/presentation/bloc_reviews_by_id/reviews_by_id_bloc.dart';
import 'package:spoosk/core/presentation/bloc_search/search_bloc.dart';
import 'package:spoosk/core/presentation/bloc_user_by_id/user_bloc.dart';
import 'package:spoosk/core/presentation/bloc_verify_code/verify_code_bloc.dart';
import 'package:spoosk/core/presentation/blocs_init/bloc/request_controller_bloc.dart';
import 'package:spoosk/core/presentation/connected_bloc/connected_bloc.dart';
import 'package:spoosk/core/presentation/routes.dart';
import 'package:spoosk/core/presentation/screens/main_screen.dart';
import 'package:spoosk/core/presentation/screens/search_screen.dart';
import 'package:spoosk/core/presentation/screens/selection.dart';
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
            create: (context) => ConnectedBloc(),
          ),
          BlocProvider(
            create: (context) => RequestControllerBloc(),
          ),
          BlocProvider(
            create: (context) => ReviewsBloc(),
          ),
          BlocProvider(
            create: (context) => ResortByIdBloc(),
          ),
          BlocProvider(
            create: (context) => ReviewsByIdBloc(),
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
          ChangeNotifierProvider(
            create: (context) => GroupButtonNotifierModel(),
            child: const MainScreen(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserDataProvider(),
          ),
          BlocProvider(
            create: (context) => MainFilterBloc(),
            child: const Selection(),
          ),
          BlocProvider(
            create: (context) => SearchResortBloc(),
            child: const SearchScreen(),
          ),
          BlocProvider(
            create: (context) => LoginBloc(),
          ),
          BlocProvider(
            create: (context) => UserProfileBloc(),
          ),
          BlocProvider(
            create: (context) => RegisterBloc(),
          ),
          BlocProvider(
            create: (context) => VerifyCodeBloc(),
          ),
          BlocProvider(
            create: (context) => ResetBloc(),
          ),
          BlocProvider(
            create: (context) => NewPasswordBloc(),
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
