import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignCode extends StatefulWidget {
  @override
  _SignCode createState() => _SignCode();
}

class _SignCode extends State<SignCode> {
  Timer _timer;
  int _counter;
  bool _timeout;

  int MAX_DURATION = 5;

  var _digits = List.filled(4, "X");
  
  void _startTimer() {
    const oneSec = const Duration(seconds: 1);

    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_counter == 0) {
          setState(() {
            timer.cancel();
            _timeout = true;
          });
        } else {
          setState(() {
            _counter--;
          });
        }
      },
    );
  }

  void _initTimer() {
    setState(() {
      _timeout = false;
      _counter = MAX_DURATION;
    });
  }

  Widget _buildCodeUI() {
    var textSentTo = Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Code sent by SMS to",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 18.0
            ),
          ),
          Text(
            "+33 234 556 7888",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 18.0
            ),
          )
        ],
      )
    );

    var digits = Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List<Widget>.generate(_digits.length, (index) => Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 5.0,
                color: Color(0xFFC6902E)
              )
            )
          ),
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          margin: EdgeInsets.all(5.0),
          child: Text(
            _digits[index],
            style: Theme.of(context).textTheme.headline3.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor
            )
          ),
        ))
      ),
    );

    var resentCode = Container(
      child: RichText(
        text: TextSpan(
        text: "Re-sent the code " + (_timeout ? "" : "(0:$_counter)"),
          style: TextStyle(
            color: _timeout ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
            decoration: TextDecoration.underline
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              print("Resent the code SMS");
              _initTimer();
              _startTimer();
            }
        )
      ),
    );

    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textSentTo,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                digits,
                resentCode
              ],
            )
          ],
        ),
      )
    );
  }

  Widget _buildKeyboard() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.yellow
      )
    );
  }

  @override
  void initState() {
    super.initState();
    _counter = MAX_DURATION;
    _timeout = false;

    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Enter the code",
          style: TextStyle(
            color: Colors.black
          ),
        )
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            _buildCodeUI(),
            _buildKeyboard()
          ],
        )
      ),
    );
  }
}