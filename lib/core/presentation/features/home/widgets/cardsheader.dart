import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';

class CardsHeaderPopularALL extends StatelessWidget {
  const CardsHeaderPopularALL(
      {super.key, required this.header, required this.showButton});

  final String header;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          showButton == true
              ? TextButton(
                  onPressed: () {
                    context.router.navigate(const AllResortsRoute());
                  },
                  child: Text(
                    'Все',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : const Text(''),
        ],
      ),
    );
  }
}
