// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/chart.dart';
import 'package:spoosk/core/presentation/bloc_by_id/resort_by_id_bloc.dart';
import 'package:spoosk/core/presentation/image.dart';
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
  late final ResortByIdBloc resortByIdBloc;

  @override
  void initState() {
    super.initState();
    resortByIdBloc = context.read<ResortByIdBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResortByIdBloc, ResortByIdState>(
      builder: (context, state) {
        print(state.resortById?.image);
        if (state is ResortByIdLoaded && state.resortById != null) {
          return PopScope(
              canPop: false,
              onPopInvoked: (didPop) {
                context
                    .read<ResortByIdBloc>()
                    .add(EventClearByIdResort(idResort: null));

                Navigator.pop(context);
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
                              .add(EventClearByIdResort(idResort: null));
                          Feedback.forTap(context);
                          context.router.pop();
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
                        final renderBox = textKey.currentContext
                            ?.findRenderObject() as RenderBox;
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
                          child: Column(children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 41,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(12))),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(image_star),
                                            const Spacer(),
                                            Text(
                                              state.resortById!.rating
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 4),
                                        child: Text(
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(fontSize: 14),
                                            "(278)"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
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
                                                        color: AppColors
                                                            .text_black))
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
                                                          color: AppColors
                                                              .text_black))
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
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
                                                          color: AppColors
                                                              .text_black))
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
                                    margin: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Text("Трассы",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                                color: AppColors.text_black)),
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
                                                    color:
                                                        AppColors.text_black)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SvgPicture.asset(image_track_length),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: Text(
                                              "${state.resortById?.trailNumber} трасс (${state.resortById?.trailLength} км)",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color: AppColors
                                                          .text_black)),
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
                                            medium: state.resortById!.redTrails
                                                .toInt(),
                                            veryHard: state
                                                .resortById!.blackTrails
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
                                                      color:
                                                          AppColors.text_black),
                                              "Подъемники"),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                        margin: const EdgeInsets
                                                            .only(
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
                                                        margin: const EdgeInsets
                                                            .only(
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
                                                        margin: const EdgeInsets
                                                            .only(
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
                                                        margin: const EdgeInsets
                                                            .only(
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
                                    child: Text(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: AppColors
                                                    .icons_active_blue),
                                        "Смотреть все тарифы"),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: const Separator()),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(top: 20),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      AdditionalList(
                                          resortById: state.resortById),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: TextButton(
                                          onPressed: () {
                                            launchUrl(state
                                                .resortById!.linkOfsite as Uri);
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          image_star,
                                          height: 18,
                                          width: 18,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        Container(
                                            margin:
                                                const EdgeInsets.only(left: 8),
                                            child: Text(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium,
                                                state.resortById!.rating
                                                    .toString())),
                                        const Spacer(),
                                        Text(
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: AppColors
                                                        .icons_active_blue),
                                            "256 отзывов")
                                      ],
                                    ),
                                  ),
                                  CustomButton(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 20),
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
                            ...<ReviewCard>[
                              ...List.filled(6, false)
                                  .map((e) => const ReviewCard())
                            ],
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
                              buttonText: "Показать все отзывы (256)",
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
                            )
                          ]),
                        ),
                      ))));
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

  List<ReviewCard> _getRevievs() {
    return <ReviewCard>[
      ...List.filled(6, false).map((e) => const ReviewCard())
    ];
  }

  _showModalBottomSheet(state) {
    showModalBottomSheet(
        isScrollControlled: true,
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
}
