import 'package:flutter/material.dart';
import 'package:lifespan_calculator/widgets/birth_date.dart';
import 'package:lifespan_calculator/widgets/calculate_button.dart';
import 'package:lifespan_calculator/widgets/remaining_life_span.dart';
import 'package:lifespan_calculator/widgets/select_birth_date_button.dart';

class AgeCalculatorScreen extends StatelessWidget {
  const AgeCalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lifespan Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          birthDate(context),
          selectBirthDateButton(context),
          calculateButton(context),
          remainingLifeSpan(context),
        ],
      ),
    );
  }
}
