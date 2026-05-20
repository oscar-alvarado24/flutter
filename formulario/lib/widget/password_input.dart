import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget{
  const PasswordInput ({
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
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: !_isPasswordVisible,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key),
        prefixIconColor: Color(widget.colorFocused),
        hintText: "*******",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.borerRadius)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borerRadius),
          borderSide: BorderSide(color: Color(widget.colorBorder)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borerRadius),
          borderSide: BorderSide(color: Color(widget.colorFocused), width: 2),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey.shade600,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      onFieldSubmitted: widget.onNameChanged,
      validator: (value) {
        if(value == null || value.isEmpty){
          return "Debes ingresar tu contraseña";
        }
        if (!RegExp(r'^.{8,16}$').hasMatch(value)) {
          return "La contraseña debe tener entre 8 y 16 caracteres";
        }
        if (!RegExp(r'(?=.*[a-z])(?=.*[A-Z])').hasMatch(value)) {
          return "Debe tener al menos una mayúscula y una minúscula";
        }
        if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
          return "Debe tener al menos un número";
        }
        if (!RegExp(r'(?=.*[!@#$%^&*(),.?":{}|<>_\-\+\/\\])').hasMatch(value)) {
          return "Debe tener al menos un carácter especial";
        }
        return null;
      },
      autovalidateMode: widget.autovalidateMode,
    );
  }
}