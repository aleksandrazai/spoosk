import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/data/models/resorts.dart';
import 'package:spoosk/core/presentation/image.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({
    super.key,
    required this.resort,
  });
  final Resorts resort;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Image.network(
                resort.mainResortImg,
                height: 108,
                width: 240,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            bottom: 21,
            left: 12,
            child: Text(
              '145',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            left: 12,
            child: Text(
              'трасс',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Positioned(
            top: 4,
            left: 185,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                elevation: 0,
                backgroundColor: const Color.fromARGB(77, 0, 0, 61),
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
            right: 35,
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
}
