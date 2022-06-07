import 'package:cherry/ui/constants.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: size.width,
        child: Center(
          child: Text(
            "Cherry",
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.2
            )
          ),
        ),
      ),
    );
  }
}
