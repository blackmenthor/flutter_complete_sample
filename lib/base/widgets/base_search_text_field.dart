import 'package:flutter/material.dart';
import 'package:flutter_complete/base/widgets/base_text_field.dart';
import 'package:flutter_complete/utils/debouncer.dart';

const _kDebounceDuration = Duration(milliseconds: 500);

class BaseSearchTextField extends StatefulWidget {
  const BaseSearchTextField({
    Key? key,
    required this.hint,
    this.label,
    this.controller,
    this.onChanged,
    this.debounceDuration = _kDebounceDuration,
  }) : super(key: key);

  final String hint;
  final String? label;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Duration debounceDuration;

  @override
  State<BaseSearchTextField> createState() => _BaseSearchTextFieldState();
}

class _BaseSearchTextFieldState extends State<BaseSearchTextField> {

  late Debouncer _debouncer;

  @override
  void initState() {
    super.initState();

    _debouncer = Debouncer(
        milliseconds: widget.debounceDuration.inMilliseconds,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _debouncer.close();
  }

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      hint: widget.hint,
      label: widget.label,
      onChanged: (query) => _debouncer.run(() {
        if (widget.onChanged != null) {
          widget.onChanged!(query);
        }
      }),
    );
  }
}
