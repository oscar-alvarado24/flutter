import 'package:flutter/material.dart';

class ImagesExample extends StatelessWidget{
  const ImagesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.network(
          "https://i5-mx.walmartimages.com/mg/gm/3pp/asr/13d0ae61-f9a5-48ba-bc89-63d12a894474.89c7b0610d67be8793d475c304b28f8b.jpeg",
          height: 100,
          width: 100,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.broken_image,
            size: 100,
            color: Colors.grey,
          ),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const SizedBox(
              height: 100,
              width: 100,
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ),
        Image.asset(
          "assets/images/contador.jpg",
          height: 100,
          width: 100,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.broken_image,
              size: 100,
              color: Colors.grey,
            ),
        )
      ],);
  }

}