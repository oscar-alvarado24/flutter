import 'package:flutter/material.dart';

class IconExample extends StatelessWidget {
  const IconExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.favorite,
          color: Colors.pinkAccent,
          size: 40,),
        Icon(
          Icons.music_note,
          color: Colors.black,
          size: 40,),
        Icon(
          Icons.ac_unit,
          color: Colors.lightBlueAccent,
          size: 40,
        )
      ],
    );
  }
}