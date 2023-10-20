import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/presentation/image.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned(
            child: SvgPicture.asset(
              image_header_background,
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
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Positioned(
            bottom: 4,
            left: 12,
            child: Text(
              'трасс',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            top: 6,
            right: 6,
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
            top: 6,
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
