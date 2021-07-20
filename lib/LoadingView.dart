import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'Constants.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          //color: Colors.amber,
          //width: 50,
          // height: 20,
          child: JumpingDotsProgressIndicator(
            fontSize: 60.0,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
