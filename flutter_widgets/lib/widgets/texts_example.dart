import 'package:flutter/material.dart';

class TextsExample extends StatelessWidget {
  const TextsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Prueba de texto",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        RichText(
          text: const TextSpan(
              text: "¿No tiene cuenta? ",
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: "Registrarme",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ]),
        )
      ],
    );
  }
}