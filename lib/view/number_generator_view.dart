import 'dart:math';

import 'package:flutter/material.dart';

class NumberGeneratorView extends StatefulWidget {
  const NumberGeneratorView({super.key});

  @override
  State<NumberGeneratorView> createState() => _NumberGeneratorViewState();
}

class _NumberGeneratorViewState extends State<NumberGeneratorView> {
  int _button1 = Random().nextInt(100) + 1;
  int _button2 = Random().nextInt(100) + 1;
  int _score1 = 0;
  int _score2 = 0;
  int _correctScore = 0;
  int _incorrectScore = 0;
  int _remainingTries = 10;

  @override
  void initState() {
    if (_button1 == _button2) {
      _button1 = Random().nextInt(100) + 1;
      _button2 = Random().nextInt(100) + 1;
    }
    super.initState();
  }

  void pressedButton1() {
    setState(() {
      if (_button1 == _button2) {
        _button1 = Random().nextInt(100) + 1;
        _button2 = Random().nextInt(100) + 1;
      } else if (_button1 > _button2) {
        _score1++;
        _correctScore++;
      } else {
        _incorrectScore++;
      }
    });
    _button1 = Random().nextInt(100) + 1;
    _button2 = Random().nextInt(100) + 1;
    _remainingTries--;
  }

  void pressedButton2() {
    setState(() {
      if (_button1 == _button2) {
        _button1 = Random().nextInt(100) + 1;
        _button2 = Random().nextInt(100) + 1;
      } else if (_button2 > _button1) {
        _score2++;
        _correctScore++;
      } else {
        _incorrectScore++;
      }
    });
    _button1 = Random().nextInt(100) + 1;
    _button2 = Random().nextInt(100) + 1;
    _remainingTries--;
  }

  void resetCount() {
    setState(() {
      _score1 = 0;
      _score2 = 0;
      _button1 = Random().nextInt(100) + 1;
      _button2 = Random().nextInt(100) + 1;
      _remainingTries = 10;
      _correctScore = 0;
      _incorrectScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Generator'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 100,
                    height: 75,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      onPressed: (_remainingTries > 0) ? pressedButton1 : null,
                      child: Text(
                        '$_button1',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 100,
                    height: 75,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: (_remainingTries > 0) ? pressedButton2 : null,
                      child: Text(
                        '$_button2',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'remaining tries: $_remainingTries',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Correct answer is: $_correctScore',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Incorrect answer is: $_incorrectScore',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            SizedBox(
              width: 200,
              height: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  resetCount();
                },
                child: const Text('Restart Game',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
