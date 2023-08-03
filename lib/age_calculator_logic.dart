import 'package:flutter/material.dart';

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

    return {'years': remainingYears, 'months': remainingMonths, 'days': remainingDays};
  }
  return null;
}

Widget birthDateDisplay(DateTime? birthDate) {
  return Center(
    child: Text(
      birthDate == null ? 'Enter your birth date' : 'Birth date: ${birthDate.toLocal()}'.split(' ')[0],
      style: const TextStyle(fontSize: 16.0),
    ),
  );
}

Widget selectBirthDateButton(BuildContext context, Function(DateTime) onPicked) {
  return Center(
    child: ElevatedButton(
      onPressed: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          onPicked(picked);
        }
      },
      child: const Text('Select birth date'),
    ),
  );
}

Widget calculateButton(VoidCallback onPressed) {
  return Center(
    child: ElevatedButton(
      onPressed: onPressed,
      child: const Text('Calculate remaining years'),
    ),
  );
}
