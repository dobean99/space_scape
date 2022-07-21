import 'package:flutter/material.dart';

class ButtonGradient extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double? width;

  const ButtonGradient({
    Key? key,
    required this.text,
    this.onPressed,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: width??MediaQuery.of(context).size.width / 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(text),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
