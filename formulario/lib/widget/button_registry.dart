import 'package:flutter/material.dart';

class ButtonRegistry extends StatelessWidget {
  const ButtonRegistry({
    required this.formValid,
    required this.onPressed,
    super.key,
  });
  final bool formValid;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Align(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: FilledButton(
            onPressed: formValid ? onPressed : null,
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text(
              'Crear Cuenta',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
