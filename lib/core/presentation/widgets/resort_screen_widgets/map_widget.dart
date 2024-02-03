import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/presentation/widgets/CustomImageNetwork.dart';
import '../../../data/models/ResortById.dart';

import '../../image.dart';

class MapWidget extends StatefulWidget {
  ResortById? resorts;
  MapWidget({super.key, required this.resorts});

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
          margin: const EdgeInsets.only(top: 20),
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
      CustomImageNetwork(
        src: [widget.resorts!.resortMap],
        fit: BoxFit.fitHeight,
      )
    ]);
  }
}
