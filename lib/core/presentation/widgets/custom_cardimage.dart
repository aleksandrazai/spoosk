import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import '../../data/models/resorts.dart';
import '../image.dart';

class CustomCardImage extends StatefulWidget {
  const CustomCardImage({
    super.key,
    required this.resort,
  }) : super();
  final Result resort;

  @override
  _CustomCardImageState createState() => _CustomCardImageState();
}

class _CustomCardImageState extends State<CustomCardImage> {
  final RequestController _requestController = RequestController();
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
              child: Image.network(
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.close_rounded),
                ),
                widget.resort.image,
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
              onPressed: () => _setFavorites(),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                elevation: 0,
                backgroundColor: const Color.fromARGB(77, 0, 0, 61),
              ),
              child: SvgPicture.asset(
                image_selected,
                width: 18,
                height: 18,
                color: fovoriteIsSelected ? Colors.red : Colors.white,
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

  _setFavorites() async {
    bool? favorite = await _requestController.getAddToFavorites(
        resortId: widget.resort.idResort);

    if (favorite != null && favorite == true) {
      setState(() {
        fovoriteIsSelected = false;
      });
    } else {
      setState(() {
        fovoriteIsSelected = false;
      });
    }
  }
}
