import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'age_calculator_viewmodel.dart';
import 'age_calculator.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AgeCalculatorViewModel(),
      child: const AgeCalculator(),
    ),
  );
}
