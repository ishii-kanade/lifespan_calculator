import 'package:flutter/material.dart';
import '../age_calculator_logic.dart';

Widget selectBirthDateButton(BuildContext context) {
  return Center(
    child: ElevatedButton(
      onPressed: () => selectBirthDate(context),
      child: const Text('Select birth date'),
    ),
  );
}