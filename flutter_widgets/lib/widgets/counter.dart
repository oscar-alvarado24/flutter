import 'package:flutter/material.dart';

class CounterSection extends StatefulWidget {
  const CounterSection({super.key});

  @override
  State<CounterSection> createState() => CounterSectionState();
}

class CounterSectionState extends State<CounterSection> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Has presionado el contador'),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$_counter ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const TextSpan(
                text: 'veces',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}