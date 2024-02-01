// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/chart.dart';
import 'package:spoosk/core/presentation/bloc_by_id/resort_by_id_bloc.dart';
import 'package:spoosk/core/presentation/bloc_reviews_by_id/reviews_by_id_bloc.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/theme/theme.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/hide_text_overflow.dart';
import 'package:spoosk/core/presentation/widgets/resort_screen_widgets/additional_list.dart';
import 'package:spoosk/core/presentation/widgets/resort_screen_widgets/chart_widget.dart';
import 'package:spoosk/core/presentation/widgets/resort_screen_widgets/custom_gallery.dart';
import 'package:spoosk/core/presentation/widgets/resort_screen_widgets/map_widget.dart';
import 'package:spoosk/core/presentation/widgets/resort_screen_widgets/tablet_widget.dart';
import 'package:spoosk/core/presentation/widgets/separator.dart';
import 'package:spoosk/core/presentation/widgets/weather_widget.dart';
import 'package:spoosk/core/presentation/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ResortScreen extends StatefulWidget {
  final String idResort;

  const ResortScreen({super.key, required this.idResort});

  @override
  State<ResortScreen> createState() => _ResortScreenState();
}

class _ResortScreenState extends State<ResortScreen>
    with AutoRouteAwareStateMixin<ResortScreen> {
  bool _seeNameResort = false;
  final textKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    context.read<ResortByIdBloc>();
    context.read<ReviewsByIdBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final state = context.watch<ResortByIdBloc>().state;
        final stateReviews = context.watch<ReviewsByIdBloc>().state;

        print('ResortByID image: ${stateReviews.reviews}');
        if (state is ResortByIdLoaded ||
            stateReviews is ReviewsByIdLoaded && state.resortById != null) {
          return PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              context.read<ResortByIdBloc>().add(EventClearByIdResort());
              context.router.navigate(const Home());
            },
            child: Scaffold(
              backgroundColor: const Color(0xFFf8f8f8),
              appBar: AppBar(
                titleTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w700,
                ),
                title: _seeNameResort
                    ? Text(
                        state.resortById!.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    : null,
                actions: [
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      fit: BoxFit.scaleDown,
                      image_comparison,
                      width: 22,
                      height: 22,
                      color: AppColors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        fit: BoxFit.scaleDown,
                        image_selected,
                        width: 22,
                        height: 22,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 17),
                    child: GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        fit: BoxFit.scaleDown,
                        image_share,
                        width: 22,
                        height: 22,
                        color: AppColors.black,
                      ),
                    ),
                  )
                ],
                leading: GestureDetector(
                    onTap: () {
                      context
                          .read<ResortByIdBloc>()
                          .add(EventClearByIdResort());
                      Feedback.forTap(context);
                      context.back();
                    },
                    child: SvgPicture.asset(
                      fit: BoxFit.scaleDown,
                      image_arrow_left,
                      width: 9.33,
                      height: 16.33,
                    )),
                iconTheme: Theme.of(context).iconTheme,
                backgroundColor: const Color(0xFFf8f8f8),
                elevation: 0,
              ),
              body: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  final renderBox =
                      textKey.currentContext?.findRenderObject() as RenderBox;
                  final position = renderBox.localToGlobal(Offset.zero);
                  if (_seeNameResort && position.dy >= 60) {
                    setState(() {
                      _seeNameResort = false;
                    });
                  } else if (!_seeNameResort && position.dy <= 60) {
                    setState(() {
                      _seeNameResort = true;
                    });
                  }

                  return true;
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        CustomGallery(
                          listUrl: [
                            state.resortById!.mainResortImg,
                            state.resortById!.image,
                            ...state.resortById!.images.map((e) => e.image)
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              Text(
                                key: textKey,
                                state.resortById!.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(fontSize: 20),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  SvgPicture.asset(image_star),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Text(
                                      state.resortById!.rating.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 14),
                                  "(${stateReviews.reviews?.length.toString()})"),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: SvgPicture.asset(
                                            image_track_length,
                                            height: 14.42,
                                            width: 18,
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                        Text(
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                            state.resortById!.trailLength
                                                .toString()),
                                        Text(" км трасс",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color:
                                                        AppColors.text_black))
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 17.25),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12),
                                            child: SvgPicture.asset(
                                              image_calendar,
                                              height: 16.5,
                                              width: 15,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Text(
                                              "${state.resortById?.beginSeason} - ${state.resortById?.endSeason}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      color:
                                                          AppColors.text_black))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12),
                                            child: SvgPicture.asset(
                                              image_credit_card,
                                              height: 13.5,
                                              width: 18,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Text(
                                              "Ски-пасс от ${state.resortById?.skipass.toInt()} р.",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color:
                                                          AppColors.text_black))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const WeatherWidget()
                              ]),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: const Separator()),
                        MapWidget(
                          resorts: state.resortById,
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: const Separator()),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Text("Трассы",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(color: AppColors.text_black)),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(image_height_mountain),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Text(
                                        "${state.resortById?.heightDifference.toInt()} м",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: AppColors.text_black)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, left: 20),
                                    child: SvgPicture.asset(
                                        image_height_mountain_ground),
                                  ),
                                  Text(
                                      "${state.resortById?.maxHeight.toInt()} м",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: AppColors.text_black)),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 13),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(image_track_length),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text(
                                          "${state.resortById?.trailNumber} трасс (${state.resortById?.trailLength} км)",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: AppColors.text_black)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: ChartWidget(
                                    chartData: Chart(
                                        easy: state.resortById!.greenTrails
                                            .toInt(),
                                        hard: state.resortById!.blueTrails
                                            .toInt(),
                                        medium:
                                            state.resortById!.redTrails.toInt(),
                                        veryHard: state.resortById!.blackTrails
                                            .toInt())),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: const Separator()),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                  color: AppColors.text_black),
                                          "Подъемники"),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                                    "Гондольный"),
                                                Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8, bottom: 8),
                                                    child: SvgPicture.asset(
                                                        image_type_handball)),
                                                Text(
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            color: AppColors
                                                                .text_black),
                                                    state.resortById!
                                                        .gondolaSkilift
                                                        .toString())
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                                    "Карусельный"),
                                                Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8, bottom: 8),
                                                    child: SvgPicture.asset(
                                                        image_type_carousel)),
                                                Text(
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            color: AppColors
                                                                .text_black),
                                                    state.resortById!
                                                        .armchairSkilift
                                                        .toString())
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                                    "Травалатор"),
                                                Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8, bottom: 8),
                                                    child: SvgPicture.asset(
                                                        image_type_travolator)),
                                                Text(
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            color: AppColors
                                                                .text_black),
                                                    state.resortById!
                                                        .travelatorsSkilift
                                                        .toString())
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                                    "Бугельный"),
                                                Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8, bottom: 8),
                                                    child: SvgPicture.asset(
                                                        image_type_bugelny)),
                                                Text(
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            color: AppColors
                                                                .text_black),
                                                    state.resortById!
                                                        .bugelnySkilift
                                                        .toString())
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: const Separator()),
                              Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Text(
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                      "Ски-пасс")),
                              const SizedBox(
                                height: 18,
                              ),
                              SkipassTable(
                                skipasses: state.resortById?.skipasses,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: TextButton(
                                    onPressed: () {
                                      _launchInAppBrowserView(Uri.parse(
                                          state.resortById!.linkSkipasses));
                                    },
                                    child: Text(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: AppColors
                                                    .icons_active_blue),
                                        "Смотреть все тарифы"),
                                  )),
                              Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: const Separator()),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      child: Text(
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                          "Описание")),
                                  HideTextOverflow(
                                    fullText: state.resortById?.info ?? "",
                                    maxSymbols: 147,
                                  )
                                ],
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: const Separator()),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(
                                          top: 20, bottom: 16),
                                      child: Text(
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                          "Дополнительные характеристики")),
                                  AdditionalList(resortById: state.resortById),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: TextButton(
                                      onPressed: () {
                                        _launchInAppBrowserView(Uri.parse(
                                            state.resortById!.linkOfsite));
                                      },
                                      child: Text(
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: AppColors
                                                      .icons_active_blue),
                                          "Официальный сайт"),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: const Separator()),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      image_star,
                                      height: 18,
                                      width: 18,
                                      fit: BoxFit.scaleDown,
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(left: 8),
                                        child: Text(
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                            state.resortById!.rating
                                                .toString())),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () {
                                        context.router.navigate(AllReviewsById(
                                            reviews: stateReviews.reviews));
                                      },
                                      child: Text(
                                        '${stateReviews.reviews?.length} отзывов',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: AppColors
                                                    .icons_active_blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomButton(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                boxDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: AppColors.white),
                                height: 40,
                                color: AppColors.primaryColor,
                                onTap: () {
                                  _showModalBottomSheet(state);
                                },
                                buttonText: "Написать отзыв",
                              )
                            ]),
                        Wrap(
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: stateReviews.reviews!.length,
                                itemBuilder: (context, index) {
                                  final reviews = stateReviews.reviews![index];
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: ReviewCard(
                                      reviews: reviews,
                                      showSettings: false,
                                    ),
                                  );
                                }),
                          ],
                        ),
                        CustomButton(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          boxDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          textStyle: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: AppColors.text_black),
                          height: 40,
                          color: AppColors.gray,
                          onTap: () {},
                          buttonText:
                              "Показать все отзывы (${stateReviews.reviews?.length.toString()})",
                        ),
                        CustomButton(
                          margin: const EdgeInsets.only(bottom: 20),
                          boxDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          textStyle: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: AppColors.white),
                          height: 40,
                          color: AppColors.primaryColor,
                          onTap: () {
                            _showModalBottomSheet(state);
                          },
                          buttonText: "Написать отзыв",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Center(
            heightFactor: 20,
            widthFactor: 20,
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ));
      },
    );
  }

  _showModalBottomSheet(state) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: AppColors.scaffoldBackgroundLight,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          print(state.resortById!.name);
          return ReviewForm(
            resort: state.resortById,
          );
        });
  }

  Future<void> _launchInAppBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }
}
