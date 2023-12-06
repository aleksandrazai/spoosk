import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/presentation/bloc_search/search_bloc.dart';
import 'package:spoosk/core/presentation/image.dart';

class CustomSearchField extends StatefulWidget {
  final bool? autofocus;
  final bool disabled;
  final VoidCallback? onTap;

  const CustomSearchField(
      {super.key, this.autofocus, required this.disabled, this.onTap});

  @override
  _CustomSearchFieldState createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController _textEditingController = TextEditingController();
  String? value;
  late SearchResortBloc _searchResortBloc;

  @override
  void initState() {
    super.initState();
    _searchResortBloc = context.read<SearchResortBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: GestureDetector(
        onTap: widget.onTap,
        child: TextField(
          textInputAction: TextInputAction.search,
          cursorColor: AppColors.primaryColor,
          onChanged: _onChange,
          controller: _textEditingController,
          autofocus: widget.autofocus ?? false,
          onSubmitted: (query) {
            _searchResortBloc.add(SearchTextInput(searchText: query));
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            enabled: !widget.disabled,
            suffixIcon: _textEditingController.text.isEmpty
                ? null
                : IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: _clearText,
                    icon: SvgPicture.asset(image_clear)),
            contentPadding: const EdgeInsets.all(0),
            hintStyle: const TextStyle(color: Color(0xFFC3C3C3)),
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xFF858585),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.gray_border, width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.gray_border, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
            ),
            hintText: "Поиск курорта",
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _textEditingController.dispose();
  //   _searchResortBloc.close();
  //   super.dispose();
  // }

  void _onChange(String text) {
    if (text.isEmpty) {
      _clearText();
    } else {
      _updateValue(text);
      if (text.length >= 3) {
        _searchResortBloc.add(SearchTextInput(searchText: text));
      }
    }
  }

  void _clearText() {
    _textEditingController.clear();
    _searchResortBloc.add(ClearText());
    _updateValue(null);
  }

  void _updateValue(String? text) {
    setState(() {
      value = text;
    });
  }
}
