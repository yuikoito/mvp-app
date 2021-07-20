import 'package:flutter/material.dart';

import 'Constants.dart';

class NoResultsFoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'نتیجه‌ای یافت نشد :(',
                    style: TextStyle(fontSize: fontSize1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
