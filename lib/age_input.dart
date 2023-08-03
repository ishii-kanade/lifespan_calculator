import 'package:flutter/material.dart';
import 'age_calculator_logic.dart';

class AgeCalculatorWidget extends StatelessWidget {
  const AgeCalculatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lifespan Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          birthDateDisplay(context),
          selectBirthDateButton(context),
          calculateButton(context),
          messageDisplay(context),
        ],
      ),
    );
  }
}
