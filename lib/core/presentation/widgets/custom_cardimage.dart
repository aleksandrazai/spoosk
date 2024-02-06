// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/user_login.dart';
import 'package:spoosk/core/data/repositories/DI/service.dart';

import 'package:spoosk/core/presentation/bloc_favorites_users/favorites_users_bloc.dart';
import 'package:spoosk/core/presentation/bloc_user_by_id/user_bloc.dart';
import 'package:spoosk/core/presentation/widgets/CustomImageNetwork.dart';
import '../../data/models/resorts.dart';
import '../image.dart';

class CustomCardImage extends StatefulWidget {
  const CustomCardImage({
    super.key,
    required this.resort,
  }) : super();
  final Resort resort;

  @override
  _CustomCardImageState createState() => _CustomCardImageState();
}

class _CustomCardImageState extends State<CustomCardImage> {
  final RequestController _requestController = RequestController();
  SingletonAuthUseCase singletonAuthUseCase = SingletonAuthUseCase();

  bool fovoriteIsSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: CustomImageNetwork(
                src: [widget.resort.image],
                height: 108,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Positioned(
          //   bottom: 21,
          //   left: 12,
          //   child: Text(
          //     resort.trailNumber.toString(),
          //     style: Theme.of(context).textTheme.bodyLarge,
          //   ),
          // ),
          // Positioned(
          //   bottom: 4,
          //   left: 12,
          //   child: Text(
          //     'трасс',
          //     style: Theme.of(context).textTheme.bodyLarge,
          //   ),
          // ),
          Positioned(
            top: 4,
            right: 2,
            child: ElevatedButton(
              onPressed: () => _setFavorites(context),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                elevation: 0,
                backgroundColor: fovoriteIsSelected
                    ? AppColors.primaryColor
                    : const Color.fromARGB(77, 0, 0, 61),
              ),
              child: SvgPicture.asset(
                image_selected,
                width: 18,
                height: 18,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 46,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                elevation: 0,
                backgroundColor: const Color.fromARGB(77, 0, 0, 61),
              ),
              child: const Icon(
                Icons.bar_chart_outlined,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkFavorites();
  }

  _checkFavorites() {
    final FavoritesUsersState blocFavorites =
        context.read<FavoritesUsersBloc>().state;

    if (blocFavorites is FavoritesUsersAll && blocFavorites.resorts != null) {
      var resortsMap = {
        for (var resort in blocFavorites.resorts!)
          resort.name: resort.inFavorites,
      };

      var status = resortsMap[widget.resort.name];

      if (status != null) {
        fovoriteIsSelected = status;
      }
    }
  }

  _setFavorites(BuildContext context) async {
    List<UserData> userBloc = await context
        .read<UserProfileBloc>()
        .dbcontrollerUserAuth
        .getDataList();
    if (userBloc.isNotEmpty && userBloc[0].token != null) {
      UserData userId = userBloc[0];
      context
          .read<FavoritesUsersBloc>()
          .add(FavoritesUsersGet(userId: userId.id!));
      bool? favorite = await _requestController.getAddToFavorites(
          resortId: widget.resort.idResort);
      if (favorite != null && favorite == true) {
        setState(() {
          fovoriteIsSelected = !fovoriteIsSelected;
          context
              .read<FavoritesUsersBloc>()
              .add(FavoritesUsersGet(userId: userId.id!));
        });
      }
    }
  }
}
