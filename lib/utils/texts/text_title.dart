import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 40, shadows: [
        Shadow(blurRadius: 20, color: Colors.white, offset: Offset(0, 0))
      ]),
    );
  }
}
