import 'package:flutter/material.dart';
import 'package:formulario/widget/button_registry.dart';
import 'package:formulario/widget/email_input.dart';
import 'package:formulario/widget/name_input.dart';
import 'package:formulario/widget/password_input.dart';
import 'package:formulario/widget/terms_and_conditions.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<StatefulWidget> createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final int _colorFocused = 0xFF085276;
  final int _colorBorder = 0xFFE0E0E0;
  final double _borerRadius = 15.0;

  bool _nameTouched = false;
  bool _emailTouched = false;
  bool _passwordTouched = false;
  bool _acceptedTerms = false;
  bool _isFormComplete = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();



  @override
  void initState() {
    super.initState();
    _nameFocus.addListener(_onNameFocusChange);
    _emailFocus.addListener(_onEmailFocusChange);
    _passwordFocus.addListener(_onPasswordFocusChange);

    _nameController.addListener(_updateFormCompleteness);
    _emailController.addListener(_updateFormCompleteness);
    _passwordController.addListener(_updateFormCompleteness);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    _nameFocus.removeListener(_onNameFocusChange);
    _emailFocus.removeListener(_onEmailFocusChange);
    _passwordFocus.removeListener(_onPasswordFocusChange);
    _nameController.removeListener(_updateFormCompleteness);
    _emailController.removeListener(_updateFormCompleteness);
    _passwordController.removeListener(_updateFormCompleteness);
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _updateFormCompleteness() {
    setState(() {
      _isFormComplete =
          _nameController.text.trim().isNotEmpty &&
              _emailController.text.trim().isNotEmpty &&
              _passwordController.text.isNotEmpty;
    });
  }

  void _onNameFocusChange() {
    if (!_nameFocus.hasFocus) {
      setState(() {
        _nameTouched = true;
      });
    }
  }

  void _onEmailFocusChange() {
    if (!_emailFocus.hasFocus) {
      setState(() {
        _emailTouched = true;
      });
    }
  }

  void _onPasswordFocusChange() {
    if (!_passwordFocus.hasFocus) {
      setState(() {
        _passwordTouched = true;
      });
    }
  }

  void _handleSubmit() {
    setState(() {
      _nameTouched = true;
      _emailTouched = true;
      _passwordTouched = true;
    });

    if (_formKey.currentState!.validate() && _acceptedTerms) {
      final name = _nameController.text.split(" ").first;
      final email = _emailController.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$name, creaste tu cuenta con el email $email'),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.indigo.shade50,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.rocket_launch,
            size: 48,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Crear Cuenta',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nombre Completo"),
              NameInput(
                controller: _nameController,
                focusNode: _nameFocus,
                onNameChanged: (name) {
                  FocusScope.of(context).requestFocus(_emailFocus);
                },
                colorFocused: _colorFocused,
                colorBorder: _colorBorder,
                borerRadius: _borerRadius,
                autovalidateMode: _nameTouched
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
              ),
              Text("Email"),
              EmailInput(
                controller: _emailController,
                focusNode: _emailFocus,
                onNameChanged: (value) {
                  FocusScope.of(context).requestFocus(_passwordFocus);
                },
                colorFocused: _colorFocused,
                colorBorder: _colorBorder,
                borerRadius: _borerRadius,
                autovalidateMode: _emailTouched
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
              ),
              Text("Contraseña"),
              PasswordInput(
                focusNode: _passwordFocus,
                controller: _passwordController,
                onNameChanged: (value) {},
                colorFocused: _colorFocused,
                colorBorder: _colorBorder,
                borerRadius: _borerRadius,
                autovalidateMode: _passwordTouched
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
              ),
              TermsAndConditions(
                value: _acceptedTerms,
                onChanged: (bool? newValue) {
                  setState(() {
                    _acceptedTerms = newValue ?? false;
                  });
                },
              ),
              ButtonRegistry(
                formValid: _isFormComplete && _acceptedTerms,
                onPressed: _handleSubmit,
              )
            ],
          ),
        ),
      ],
    );
  }
}
