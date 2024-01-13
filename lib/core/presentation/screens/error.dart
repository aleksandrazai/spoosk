import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../colors.dart';
import '../connected_bloc/connected_bloc.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen>
    with TickerProviderStateMixin {
  bool _flag = true;

  late Animation<double> _myAnimation;
  late AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectedBloc, ConnectedState>(
      listener: (context, state) {
        if (state is ConnectedSucessState) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      builder: (context, state) {
        return PopScope(
            canPop: false,
            child: Container(
              color: AppColors.background,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 800),
                      crossFadeState: state is ConnectedSucessState
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: const SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(
                          size: 50,
                          Icons.check_rounded,
                          color: Colors.green,
                        ),
                      ),
                      secondChild: const SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.close_rounded,
                          size: 50,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          if (state is ConnectedSucessState) {
                            Navigator.pop(context);
                          }
                        },
                        child: Text(state is ConnectedSucessState
                            ? "Вернуться назад :)"
                            : "Нет сети :(")),
                  ],
                ),
              ),
            ));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _myAnimation = CurvedAnimation(curve: Curves.linear, parent: _controller);
  }
}
