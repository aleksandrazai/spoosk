import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/presentation/features/initial/bloc/connected_bloc/connected_bloc.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import '../../../../colors.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  ErrorScreenState createState() => ErrorScreenState();
}

class ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectedBloc, ConnectedState>(
      listener: (context, state) {},
      builder: (context, state) {
        return PopScope(
            canPop: false,
            child: Container(
              color: AppColors.background,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(17)),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                        width: MediaQuery.of(context).size.width,
                        height: 165,
                        error_page_image),
                  ),
                  Text(
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              color: AppColors.primaryFontLight, fontSize: 24),
                      "Упс!"),
                  const SizedBox(
                    height: 28,
                  ),
                  Center(
                    child: Text(
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryFontLight,
                                fontSize: 14),
                        "Похоже возникли проблемы с подключением. Попробуйте обновить страницу или проверьте ваше подключение к интернету."),
                  ),
                  const Spacer(),
                  CustomButton(
                    boxDecoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: AppColors.white),
                    height: 40,
                    color: AppColors.primaryColor,
                    buttonText: 'Обновить страницу',
                    onTap: () {
                      if (state is ConnectedSucessState) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ]),
              ),
            ));
      },
    );
  }
}
