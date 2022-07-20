import 'package:flutter/material.dart';

class ButtonGradient extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const ButtonGradient({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width/3,
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
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: onPressed,
                child: Text(text),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
