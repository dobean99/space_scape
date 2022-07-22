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
      name: 'Canary',
      cost: 0,
      speed: 250,
      spriteId: 0,
      assetPath: 'assets/images/ship_A.png',
      level: 1,
    ),
    SpaceShip(
      name: 'Dusky',
      cost: 100,
      speed: 400,
      spriteId: 1,
      assetPath: 'assets/images/ship_B.png',
      level: 2,
    ),
    SpaceShip(
      name: 'Condor',
      cost: 200,
      speed: 300,
      spriteId: 2,
      assetPath: 'assets/images/ship_C.png',
      level: 2,
    ),
    SpaceShip(
      name: 'CXC',
      cost: 400,
      speed: 300,
      spriteId: 3,
      assetPath: 'assets/images/ship_D.png',
      level: 3,
    ),
    SpaceShip(
      name: 'Raptor',
      cost: 550,
      speed: 300,
      spriteId: 4,
      assetPath: 'assets/images/ship_E.png',
      level: 3,
    ),
    SpaceShip(
      name: 'Raptor-X',
      cost: 700,
      speed: 350,
      spriteId: 5,
      assetPath: 'assets/images/ship_F.png',
      level: 3,
    ),
    SpaceShip(
      name: 'Albatross',
      cost: 850,
      speed: 400,
      spriteId: 6,
      assetPath: 'assets/images/ship_G.png',
      level: 4,
    ),
    SpaceShip(
      name: 'DK-809',
      cost: 1000,
      speed: 450,
      spriteId: 7,
      assetPath: 'assets/images/ship_H.png',
      level: 4,
    ),
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
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                CarouselSlider.builder(
                    itemCount: listSpaceShip.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      SpaceShip item = listSpaceShip[itemIndex];
                      return Column(
                        children: [
                          Stack(
                            children: [
                              Center(
                                child: Container(
                                  decoration:  const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.redAccent,
                                    boxShadow: [BoxShadow(blurRadius: 5,)]
                                  ),
                                  height: 150,
                                  width: 150,
                                ),
                              ),
                              Center(child: Image.asset(item.assetPath)),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            item.name,
                            style: const TextStyle(color: Colors.red),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Speed: ${item.speed}",
                          ),
                          Text("Level: ${item.level}"),
                          Text("Cost: ${item.cost}"),
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
                      height: 400,
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
            const SizedBox(
              height: 50,
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
