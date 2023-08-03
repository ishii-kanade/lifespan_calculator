import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../age_calculator_viewmodel.dart';

Widget birthDate(BuildContext context) {
  final viewModel = Provider.of<AgeCalculatorViewModel>(context);
  return Center(
    child: Text(
      viewModel.birthDate == null
          ? 'Enter your birth date'
          : 'Birth date: ${viewModel.birthDate!.toLocal()}'.split(' ')[0],
      style: const TextStyle(fontSize: 16.0),
    ),
  );
}