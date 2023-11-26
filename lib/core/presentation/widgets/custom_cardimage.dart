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
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Image.network(
                resort.image,
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
}
