import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../age_calculator_logic.dart';
import '../age_calculator_viewmodel.dart';

Widget calculateButton(BuildContext context) {
  return Center(
    child: ElevatedButton(
      onPressed: () {
        final viewModel =
        Provider.of<AgeCalculatorViewModel>(context, listen: false);
        final result = calculateRemainingLife(viewModel.birthDate);
        if (result != null) {
          viewModel.setMessage(
              'You have approximately ${result['years']} years, ${result['months']} months, and ${result['days']} days left.');
        }
      },
      child: const Text('Calculate remaining years'),
    ),
  );
}