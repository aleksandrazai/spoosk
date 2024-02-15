import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/presentation/features/review/bloc/bloc_reviews/reviews_bloc.dart';
import 'package:spoosk/core/presentation/features/review/bloc/bloc_reviews_by_id/reviews_by_id_bloc.dart';
import 'package:spoosk/core/presentation/features/review/bloc/bloc_reviews_post/reviews_post_bloc.dart';
import 'package:spoosk/core/presentation/features/search/bloc/bloc_search_history/search_history_bloc.dart';
import 'package:spoosk/core/presentation/features/selection/bloc/bloc_region/region_bloc.dart';
import 'package:spoosk/core/presentation/features/selection/provider/advanced_filter/all_filter_params.dart';
import 'package:spoosk/core/presentation/features/selection/provider/advanced_filter/slider.dart';
import 'package:spoosk/core/presentation/features/selection/provider/main_filter/levels.dart';
import 'package:spoosk/core/presentation/features/selection/provider/main_filter/months.dart';
import 'package:spoosk/core/presentation/features/selection/provider/main_filter/regions.dart';
import 'package:spoosk/core/generated/l10n.dart';
import 'package:spoosk/core/presentation/features/auth/login/bloc/bloc_login/login_bloc.dart';
import 'package:spoosk/core/presentation/features/auth/register/bloc/bloc_register/register_bloc.dart';
import 'package:spoosk/core/presentation/features/auth/reset_password/bloc/bloc_password_new/new_password_bloc.dart';
import 'package:spoosk/core/presentation/features/auth/reset_password/bloc/bloc_password_reset/reset_bloc.dart';
import 'package:spoosk/core/presentation/features/auth/verify_code/bloc/bloc_verify_code/verify_code_bloc.dart';
import 'package:spoosk/core/presentation/features/home/bloc/popular_resorts/request_controller_bloc.dart';
import 'package:spoosk/core/presentation/features/home/bloc/reviews_home/reviews_home_bloc.dart';
import 'package:spoosk/core/presentation/features/initial/bloc/connected_bloc/connected_bloc.dart';
import 'package:spoosk/core/presentation/features/resort/bloc/bloc_by_id/resort_by_id_bloc.dart';
import 'package:spoosk/core/presentation/features/search/bloc/bloc_search/search_bloc.dart';
import 'package:spoosk/core/presentation/features/selection/bloc/bloc_mainFilter.dart/mainFilter_bloc.dart';
import 'package:spoosk/core/presentation/features/user/favourites/bloc/bloc_favorites_users/favorites_users_bloc.dart';
import 'package:spoosk/core/presentation/features/user/profile/bloc_user_by_id/user_bloc.dart';
import 'package:spoosk/core/presentation/features/user/reviews/bloc_user_reviews/user_reviews_bloc.dart';
import 'package:spoosk/core/presentation/routes.dart';
import 'package:spoosk/core/presentation/features/initial/view/main_screen.dart';
import 'package:spoosk/core/presentation/features/search/view/search_screen.dart';
import 'package:spoosk/core/presentation/features/selection/view/selection.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ConnectedBloc(),
          ),
          BlocProvider<PorularResortBloc>(
            create: (context) => PorularResortBloc(),
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
            create: (context) => AdvancedFilterNotifier(),
            child: const MainScreen(),
          ),
          ChangeNotifierProvider(
            create: (context) => SliderNotifier(),
            child: const MainScreen(),
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
            create: (context) => SearchHistoryBloc(),
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
          BlocProvider(
            create: (context) => ReviewsHomeBloc(),
          ),
          BlocProvider(
            create: (context) => ReviewsPostBloc(),
          ),
          BlocProvider(
            create: (context) => UserReviewsBloc(),
          ),
          BlocProvider(
            create: (context) => FavoritesUsersBloc(),
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
          routerConfig: appRouter.config(
            navigatorObservers: () => [AutoRouteObserver()],
          ),
        ));
  }
}
