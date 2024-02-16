// ignore_for_file: use_build_context_synchronously, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/user_login.dart';
import 'package:spoosk/core/presentation/features/home/bloc/popular_resorts/request_controller_bloc.dart';
import 'package:spoosk/core/presentation/features/user/favourites/bloc/bloc_favorites_users/favorites_users_bloc.dart';
import 'package:spoosk/core/presentation/features/user/profile/bloc_user_by_id/user_bloc.dart';
import 'package:spoosk/core/presentation/widgets/CustomImageNetwork.dart';
import 'package:spoosk/core/presentation/widgets/custom_dialog.dart';
import '../../../../../data/models/resorts.dart';
import '../../../../image.dart';

class CustomCardImage extends StatefulWidget {
  const CustomCardImage({
    super.key,
    required this.resort,
  }) : super();
  final Resort resort;

  @override
  CustomCardImageState createState() => CustomCardImageState();
}

class CustomCardImageState extends State<CustomCardImage> {
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
                openGallery: false,
                src: [widget.resort.image],
                height: 108,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 2,
            child: FavouriteButton(
              resort: widget.resort,
            ),
          ),
          // Раскоммитить для добавления в сравнения
          // Positioned(
          //   top: 4,
          //   right: 46,
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     style: ElevatedButton.styleFrom(
          //       shape: const CircleBorder(),
          //       elevation: 0,
          //       backgroundColor: const Color.fromARGB(77, 0, 0, 61),
          //     ),
          //     child: const Icon(
          //       Icons.bar_chart_outlined,
          //       size: 18,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({
    super.key,
    required this.resort,
  });

  final Resort resort;

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  final RequestController _requestController = RequestController();

  bool fovoriteIsSelected = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => setFavorites(context),
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
    );
  }

  @override
  void initState() {
    fovoriteIsSelected = widget.resort.inFavorites;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FavouriteButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    fovoriteIsSelected = widget.resort.inFavorites;
  }

  setFavorites(BuildContext context) async {
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
          context.read<PorularResortBloc>().add(LoadAllPorularResorts());
        });
      }
    }
    if (userBloc.isEmpty) {
      showAuthDialog(context);
    }
  }

  void showAuthDialog(BuildContext context) {
    CustomDialog.showCustomDialog(
      context: context,
      title: 'Необходима авторизация',
      bodyText: 'Пожалуйста, авторизируйтесь для добавления в избранное',
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Text('Закрыть',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.primaryColor))),
      ],
    );
  }
}
