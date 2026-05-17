import 'package:flutter/material.dart';

class ButtonsExample extends StatelessWidget {
  final GlobalKey _buttonKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          key: _buttonKey,
          onPressed: () => _mostrarSnackbar(context),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, foregroundColor: Colors.white),
          child: const Text("Mostrar Snackbar"),
        ),
      ],
    );
  }

  void _mostrarSnackbar(BuildContext context) {
    // Obtener posición y tamaño del botón
    final RenderBox renderBox =
    _buttonKey.currentContext!.findRenderObject() as RenderBox;

    final position = renderBox.localToGlobal(Offset.zero);
    final buttonSize = renderBox.size;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calcular distancia desde abajo
    final distanceFromBelow = screenHeight - position.dy - buttonSize.height - 20;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('¡Aparezco encima del botón!'),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: distanceFromBelow,
          left: 16,
          right: 16,
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }
}