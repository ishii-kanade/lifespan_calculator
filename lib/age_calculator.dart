import 'package:flutter/material.dart';
import 'age_input.dart';

class AgeCalculator extends StatelessWidget {
  const AgeCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AgeCalculatorWidget(),
    );
  }
}
