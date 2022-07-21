import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:space_scape/models/space_ship.dart';
import 'package:space_scape/utils/buttons/button_gradient.dart';
import 'package:space_scape/utils/texts/text_title.dart';

class SpaceShipShop extends StatefulWidget {
  const SpaceShipShop({Key? key}) : super(key: key);

  @override
  State<SpaceShipShop> createState() => _SpaceShipShopState();
}

class _SpaceShipShopState extends State<SpaceShipShop> {
  final List<SpaceShip> listSpaceShip = [
    SpaceShip(
        name: 'A',
        assetPath: "assets/images/ship_A.png",
        cost: 1,
        spriteId: 1,
        level: 1,
        speed: 1),
    SpaceShip(
        name: 'A',
        assetPath: "assets/images/ship_B.png",
        cost: 1,
        level: 1,
        spriteId: 1,
        speed: 1),
    SpaceShip(
        name: 'A',
        assetPath: "assets/images/ship_C.png",
        cost: 1,
        spriteId: 1,
        level: 1,
        speed: 1),
  ];
  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextTitle(title: "Space Shop"),
            Column(

              children: [
                CarouselSlider.builder(
                    itemCount: listSpaceShip.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      SpaceShip item = listSpaceShip[itemIndex];
                      return Column(
                        children: [
                          Image.asset(item.assetPath),
                          Text(
                            item.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Speed:${item.speed}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text("Level:${item.level}"),
                          Text("Cost:${item.cost}"),
                          ButtonGradient(
                            width: MediaQuery.of(context).size.width / 4,
                            text: 'Buy',
                            onPressed: () {},
                          ),
                        ],
                      );
                    },
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPos = index;
                        });
                      },
                      height:400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listSpaceShip.map((url) {
                    int index = listSpaceShip.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPos == index ? Colors.blue : Colors.grey,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            ButtonGradient(
              text: 'Back',
              width: MediaQuery.of(context).size.width / 1.5,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
