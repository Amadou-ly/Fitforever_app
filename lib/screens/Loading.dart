import 'package:fitforeverapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kTextLightColor,
      child: Center(
        child: SpinKitFadingCircle(
          color: kTextColor,
          size: 60,
        ),
      ),
    );
  }
}
