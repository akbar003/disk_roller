import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiscRolling extends StatefulWidget {
  const DiscRolling({super.key});

  @override
  State<DiscRolling> createState() => _DiscRollingState();
}

class _DiscRollingState extends State<DiscRolling> {
  var leftDice = 1;
  var rightDice = 1;
  var attempt = 0;
  click() {
    setState(() {
      leftDice = Random().nextInt(6)+1;
      rightDice = Random().nextInt(6)+1;
      attempt++;
      if (leftDice == rightDice) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Congratulations!'),
              content: Text('All dice are the same after $attempt attempts.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Disc Rolling $leftDice',
          style:const TextStyle(color: Colors.limeAccent),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        click();
                      },
                      child: Image(
                          image: AssetImage("images/dice$leftDice.png")))),
              Expanded(
                  child: GestureDetector(
                    onTap: () {
                      click();
                    },
                   child: Image(image: AssetImage("images/dice$rightDice.png")),
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        click();
                      },
                      child: Image(
                          image: AssetImage("images/dice$leftDice.png")))),
              Expanded(
                  child: GestureDetector(
                    onTap: () {
                      click();
                    },
                    child: Image(image: AssetImage("images/dice$rightDice.png")),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
