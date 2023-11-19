import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/presentation/bloc_region/region_bloc.dart';
import 'package:spoosk/core/presentation/widgets/CustomButtonWithContent.dart';
import 'package:spoosk/core/presentation/widgets/custom_searchfield.dart';

class SelectionScreenBottomSheetRegion extends StatefulWidget {
  const SelectionScreenBottomSheetRegion({
    super.key,
  });

  @override
  _SelectionScreenBottomSheetRegionState createState() =>
      _SelectionScreenBottomSheetRegionState();
}

class _SelectionScreenBottomSheetRegionState
    extends State<SelectionScreenBottomSheetRegion> {
  late final RegionBloc regionBloc;

  @override
  void initState() {
    super.initState();
    regionBloc = context.read<RegionBloc>();
    regionBloc.add(LoadAllRegions());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionBloc, RegionState>(
      builder: (context, state) {
        if (state is RegionLoaded) {
          return Column(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                        style: Theme.of(context).textTheme.headlineMedium,
                        "В каком регионе вы хотите покататься?"),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              CustomSearchField(autofocus: true),
              Container(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 8,
                  children: state.regionsAll.map<Widget>((Regions) {
                    final region = Regions.region;
                    return CustomButtonFilter(
                      margin: const EdgeInsets.only(top: 12),
                      text: region,
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
