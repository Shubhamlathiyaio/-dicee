import 'package:dicee/constents/color.dart';
import 'package:flutter/material.dart';

class Dicee {
  int side;
  double padding = 125;
  Dicee({required this.side});
  Widget getDicee() {
    return SizedBox.square(
      child: Card(
        color: diceeBG,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 3; i++)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int j = 0; j < 3; j++)
                        dot(shouldeColord(i * 3 + j + 1, side), 25)
                    ],
                  )
              ],
            ),
          )),
    );
  }

  bool shouldeColord(int ind, int side) {
    switch (side) {
      case 1:
        return ind == 5;
      case 2:
        return ind == 1 || ind == 9;
      case 3:
        return ind == 1 || ind == 5 || ind == 9;
      case 4:
        return ind == 1 || ind == 3 || ind == 7 || ind == 9;
      case 5:
        return ind % 2 == 1;
      case 6:
        return ind!=2 && ind!=8;
      default:
        return false;
    }
  }
}

Widget dot(bool isColor, double size) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          color: isColor ? dotColor : Colors.transparent),
    ),
  );
}
