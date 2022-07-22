import 'package:flutter/material.dart';
import 'package:space_scape/game/game_play.dart';
import 'package:space_scape/screens/settings/setting_screen.dart';
import 'package:space_scape/screens/space_ship_shop/space_ship_shop.dart';
import 'package:space_scape/utils/buttons/button_gradient.dart';
import 'package:space_scape/utils/texts/text_title.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const TextTitle(title: "SpaceScape"),
            ButtonGradient(
              text: 'Play',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => GamePlay()));
              },
            ),
            ButtonGradient(
              text: 'Shop',
              onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const SpaceShipShop()));
              },
            ),
            ButtonGradient(
              text: 'Settings',
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const SettingScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
