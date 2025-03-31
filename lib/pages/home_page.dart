import 'dart:math';

import 'package:dicee/commons/common_text.dart';
import 'package:dicee/constents/color.dart';
import 'package:dicee/resources/dicee.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int side1 = Random().nextInt(5) + 1;
  int side2 = Random().nextInt(5) + 1;

  void shuffle() {
    side1 = Random().nextInt(5) + 1;
    side2 = Random().nextInt(5) + 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBG,
      appBar: AppBar(
        backgroundColor: appBarBG,
        centerTitle: true,
        title: CommonText(
          data: "Roll the Dicee",
          fontColor: appBarFont,
          fontSize: 24,
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: shuffle,
                child: Dicee(side: side1).getDicee()),
            GestureDetector(
                onTap: shuffle,
                child: Dicee(side: side2).getDicee()),
          ],
        ),
      )),
    );
  }
}
