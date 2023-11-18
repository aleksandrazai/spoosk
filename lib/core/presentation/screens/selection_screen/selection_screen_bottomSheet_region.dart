import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/presentation/bloc_region/region_bloc.dart';
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
                  Text(
                      style: Theme.of(context).textTheme.headlineMedium,
                      "В каком регионе вы хотите покататься?"),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const CustomSearchField(),
              SizedBox(
                height: 200,
                width: 200,
                child: ListView.builder(
                    itemCount: state.regionsAll.length,
                    itemBuilder: (BuildContext context, index) {
                      final region = state.regionsAll[index].region;
                      return CustomButtonSelection(
                        buttonText: region,
                        onPressed: () {},
                      );
                    }),
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class CustomButtonSelection extends StatelessWidget {
  CustomButtonSelection({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  final VoidCallback? onPressed;
  final String buttonText;
  Color borderColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: borderColor, width: 0.1),
        ),
      ),
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
