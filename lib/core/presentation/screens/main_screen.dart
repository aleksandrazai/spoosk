import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [Home(), Selection()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.icons_active_blue,
            unselectedLabelStyle:
                TextStyle(color: AppColors.icons_not_Active_gray),
            selectedLabelStyle: TextStyle(color: AppColors.icons_active_blue),
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
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
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      height: 20,
                      width: 20,
                      image_comparison,
                      color: AppColors.icons_not_Active_gray),
                  label: 'Сравнение',
                  activeIcon: SvgPicture.asset(
                    height: 20,
                    width: 20,
                    image_comparison,
                    color: AppColors.icons_active_blue,
                  )),
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
  }
}
