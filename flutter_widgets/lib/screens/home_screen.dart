import 'package:flutter/material.dart';
import 'package:flutter_widgets/widgets/texts_example.dart';

import '../widgets/buttons_example.dart';
import '../widgets/counter.dart';
import '../widgets/icon_example.dart';
import '../widgets/images_example.dart';
import '../widgets/save_button.dart';
import '../widgets/terms_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<CounterSectionState> _counterKey =
      GlobalKey<CounterSectionState>();

  @override
  Widget build(BuildContext context) {
    //Para crear una ventana en Flutter usamos Scaffold
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              //Stack + Align nos permite  posicionar un widgets topRight,topLeft,topCenter,center,
              //centerLeft,centerRight, center,bottomLeft,bottomRight y bottomCenter
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/images/color_bar2.png",
                  height: 180,
                  width: 110,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(height: 180, width: 110),
                ),
              ),
              //Stack + Positioned nos permite  posicionar un widgets en donde deseemos asignando un valor
              Positioned(
                top: 200,
                left: -13,
                child: Image.asset(
                  "assets/images/color_bar.png",
                  height: 200,
                  width: 100,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(height: 200, width: 100),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextsExample(),
                        const SizedBox(height: 12),
                        IconExample(),
                        const SizedBox(height: 12),
                        ImagesExample(),
                        const SizedBox(height: 12),
                        SaveButton(),
                        const SizedBox(height: 12),
                        ButtonsExample(),
                        const SizedBox(height: 12),
                        CounterSection(key: _counterKey),
                        const SizedBox(height: 16),
                        TermsText(),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counterKey.currentState?.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
