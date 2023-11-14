import 'package:flutter/material.dart';

class CardsHeaderPopularALL extends StatelessWidget {
  const CardsHeaderPopularALL({
    super.key,
    required this.header,
    required this.all,
  });

  final String header;
  final String all;

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
          Text(
            all, //добавить переход на все курорты
            style: TextStyle(
              color: Color(0xFF005FF9),
              fontSize: 14,
              fontFamily: 'Nunito Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
