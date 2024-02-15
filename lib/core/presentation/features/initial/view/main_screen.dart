// ignore_for_file: deprecated_member_use, use_build_context_synchronously
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/presentation/features/home/bloc/popular_resorts/request_controller_bloc.dart';
import 'package:spoosk/core/presentation/features/initial/bloc/connected_bloc/connected_bloc.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/features/initial/view/error.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool dialog = false;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      inheritNavigatorObservers: true,
      routes: const [Home(), Selection(), Favorites(), Profile()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return BlocConsumer<ConnectedBloc, ConnectedState>(
          listener: (context, state) async {
            if (state is ConnectedFailureState && dialog != true) {
              setState(() {
                dialog = true;
              });
              bool? canContinie = await showDialog<bool>(
                useSafeArea: true,
                barrierDismissible: false,
                context: context,
                builder: (context) => ErrorScreen(),
              );
              setState(() {
                dialog = false;
              });
            }

            print('\x1B[31m$state\x1B[0m');
          },
          builder: (context, state) {
            return Scaffold(
              body: child,
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.icons_active_blue,
                unselectedLabelStyle:
                    TextStyle(color: AppColors.icons_not_Active_gray),
                selectedLabelStyle:
                    TextStyle(color: AppColors.icons_active_blue),
                currentIndex: tabsRouter.activeIndex,
                onTap: (int index) {
                  if (index == 0) {
                    // Navigate to the Home page.
                    AutoRouter.of(context).navigate(const Home());
                  } else if (index == 1) {
                    // Navigate to the Selection page.
                    AutoRouter.of(context).navigate(const Selection());
                  }
                  // else if (index == 2) {
                  //   // Navigate to the Comparison page.
                  //   AutoRouter.of(context).navigate(const Comparison());
                  else if (index == 2) {
                    // Navigate to the Selected page.
                    AutoRouter.of(context).navigate(
                      const Favorites(),
                    );
                  } else if (index == 3) {
                    // Navigate to the Profile page.
                    AutoRouter.of(context).navigate(const Profile());
                  }
                },
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          height: 20,
                          width: 20,
                          image_home,
                          color: AppColors.icons_not_Active_gray),
                      label: 'Главная',
                      activeIcon: SvgPicture.asset(
                        height: 20,
                        width: 20,
                        image_home,
                        color: AppColors.icons_active_blue,
                      )),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          height: 20,
                          width: 20,
                          image_search,
                          color: AppColors.icons_not_Active_gray),
                      label: 'Подбор',
                      activeIcon: SvgPicture.asset(
                        height: 20,
                        width: 20,
                        image_search,
                        color: AppColors.icons_active_blue,
                      )),
                  // BottomNavigationBarItem(
                  //     icon: SvgPicture.asset(
                  //         height: 20,
                  //         width: 20,
                  //         image_comparison,
                  //         color: AppColors.icons_not_Active_gray),
                  //     label: 'Сравнение',
                  //     activeIcon: SvgPicture.asset(
                  //       height: 20,
                  //       width: 20,
                  //       image_comparison,
                  //       color: AppColors.icons_active_blue,
                  //     )),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          height: 20,
                          width: 20,
                          image_selected,
                          color: AppColors.icons_not_Active_gray),
                      label: 'Избранное',
                      activeIcon: SvgPicture.asset(
                        height: 20,
                        width: 20,
                        image_selected,
                        color: AppColors.icons_active_blue,
                      )),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          height: 20,
                          width: 20,
                          image_profile,
                          color: AppColors.icons_not_Active_gray),
                      label: 'Профиль',
                      activeIcon: SvgPicture.asset(
                        height: 20,
                        width: 20,
                        image_profile,
                        color: AppColors.icons_active_blue,
                      )),
                ],
              ),
            );
          },
        );
      },
    );
  }
}