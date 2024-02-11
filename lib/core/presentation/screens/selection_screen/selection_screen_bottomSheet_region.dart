import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/data/models/regions.dart';
import '../../../colors.dart';
import '../../../data/models/fliter_models.dart/main_filter/regions.dart';
import '../../bloc_region/region_bloc.dart';
import '../../widgets/CustomButton.dart';
import '../../widgets/CustomButtonWithContent.dart';

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
  late final SelectedRegionsModel regionModel;

  @override
  void initState() {
    super.initState();
    regionBloc = context.read<RegionBloc>();
    regionBloc.add(LoadAllRegions());
    regionModel = Provider.of<SelectedRegionsModel>(context, listen: false);
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
                  SizedBox(
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
              //убрали поиск до добавления новых регионов
              //CustomSearchField(autofocus: true),
              Container(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 8,
                  children: state.regionsAll.map<Widget>((Regions) {
                    final region = Regions.region;
                    return CustomButtonFilter(
                      margin: const EdgeInsets.only(top: 12),
                      text: region,
                      currentSelected: regionModel.isSelectedRegion(region),
                      onPress: () {
                        setState(() {
                          regionModel.toggleSelectedRegion(region);
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 84,
              ),
              CustomButton(
                  textStyle: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: AppColors.white, fontSize: 16),
                  boxDecoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 36,
                  buttonText: "Применить",
                  color: AppColors.primaryColor,
                  onTap: () {
                    List<String> selectedRegions =
                        Provider.of<SelectedRegionsModel>(context,
                                listen: false)
                            .selectedRegions;
                    print("Selected: $selectedRegions");
                    Navigator.pop(context);
                  }),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
