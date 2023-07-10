import 'package:flutter/material.dart';

import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    Key? key,
    required this.controller,
    required this.isText,
    required this.isError,
    required this.label,
    this.testError,
    this.myOnChangeFunction,
  }) : super(key: key);

  final TextEditingController controller;
  final bool isText;
  final bool isError;
  final String label;
  final String? testError;
  final void Function(String)? myOnChangeFunction;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      child: TextField(
        onChanged: (text) {
          widget.myOnChangeFunction!(text);
        },
        controller: widget.controller,
        keyboardType: widget.isText ? TextInputType.text : TextInputType.number,
        decoration: InputDecoration(
          errorText: widget.isError ? 'Este campo no puede estar vacío' : null,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
