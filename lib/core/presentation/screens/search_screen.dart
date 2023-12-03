import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spoosk/core/presentation/widgets/widgets.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CustomSearchField(
        disabled: false,
        autofocus: true,
      ),
    );
  }
}
