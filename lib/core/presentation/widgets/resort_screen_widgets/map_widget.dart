import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/data/models/resorts.dart';
import 'package:spoosk/core/presentation/image.dart';

class MapWidget extends StatefulWidget {
  Result? resorts;
  MapWidget({Key? key, required this.resorts}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image_location,
                width: 20,
                height: 20,
                fit: BoxFit.scaleDown,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(widget.resorts!.region,
                    style: Theme.of(context).textTheme.bodyMedium),
              )
            ],
          ),
        ),
      ),
      Image.asset(
        image_map,
        fit: BoxFit.fitHeight,
      )
    ]);
  }
}
