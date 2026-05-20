import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    required this.value,
    required this.onChanged,
    super.key
  });

  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 14),
        child:Row(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: "Al registrarte aceptas los ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "términos",
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Ir a los términos');
                        },
                    ),
                    const TextSpan(text: " y el "),
                    TextSpan(
                      text: "aviso de privacidad.",
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('aviso de privacidad');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
