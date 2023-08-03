import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'age_calculator_viewmodel.dart';

Future<void> selectBirthDate(BuildContext context) async {
  final viewModel = Provider.of<AgeCalculatorViewModel>(context, listen: false);
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );

  if (picked != null) {
    viewModel.setBirthDate(picked);
  }
}

Map<String, int>? calculateRemainingLife(DateTime? birthDate) {
  if (birthDate != null) {
    final currentDate = DateTime.now();
    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;
    int days = currentDate.day - birthDate.day;

    if (days < 0) {
      months -= 1;
      days += 30; // An approximate average value
    }

    if (months < 0) {
      years -= 1;
      months += 12;
    }

    final remainingYears = 80 - years; // Assume average lifespan is 80 years
    final remainingMonths = 12 - months; // Remaining months in current year
    final remainingDays = 30 - days; // Remaining days in current month

    return {
      'years': remainingYears,
      'months': remainingMonths,
      'days': remainingDays,
    };
  }
  return null;
}
