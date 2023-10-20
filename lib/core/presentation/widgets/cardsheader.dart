import 'package:flutter/material.dart';

class CardsHeaderPopularALL extends StatelessWidget {
  const CardsHeaderPopularALL({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Популярные курорты',
            style: TextStyle(
              color: Color(0xFF4C4E4F),
              fontSize: 20,
              fontFamily: 'Nunito Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Все', //добавить переход на все курорты
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
