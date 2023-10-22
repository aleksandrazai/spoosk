import 'package:flutter/material.dart';
import 'package:spoosk/core/presentation/widgets/star_icon.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          // width: 100,
          height: 150,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 41,
                    height: 41,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(84),
                      ),
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Имя Фамилия'),
                      Text(
                        '23.12.2023',
                        style: TextStyle(
                          color: Color(0xFF9B9CA0),
                          fontSize: 12,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    'Роза хутор',
                    style: TextStyle(
                      color: Color(0xFF4C4E4F),
                      fontSize: 18,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  StarIcon(),
                  StarIcon(),
                  StarIcon(),
                  StarIcon(),
                  StarIcon(),
                ],
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 320,
                    child: Text(
                        'Lorem ipsum dolor sit amet consectetur. Sit ultrices massa enim z. Justo faucibus lectus molestie sit sagittis. Tincidunt tincidunt neque rutrum eu morbi urna sagittis phasellus quis. '),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
