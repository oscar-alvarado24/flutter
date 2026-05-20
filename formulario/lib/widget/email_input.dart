import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget{
  const EmailInput ({
    required this.focusNode,
    required this.controller,
    required this.onNameChanged,
    required this.colorFocused,
    required this.colorBorder,
    required this.borerRadius,
    this.autovalidateMode = AutovalidateMode.disabled,
    super.key,
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final void Function(String) onNameChanged;
  final int colorFocused;
  final int colorBorder;
  final double borerRadius;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          prefixIconColor: Color(colorFocused),
          hintText: "email@example.com",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(borerRadius)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borerRadius),
            borderSide: BorderSide(color: Color(colorBorder)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borerRadius),
            borderSide: BorderSide(color: Color(colorFocused), width: 2),
          ),
        ),
        onFieldSubmitted: onNameChanged,
        validator: (value) {
          if(value == null || value.isEmpty){
            return "Debes ingresar tu email";
          }
          final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
          if (!emailRegex.hasMatch(value)) {
            return "Ingresa un email válido";
          }
          return null;
        },
        autovalidateMode: autovalidateMode,
    );
  }
}