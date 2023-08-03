import 'package:flutter/material.dart';
import 'age_calculator_logic.dart';

class AgeInput extends StatefulWidget {
  const AgeInput({Key? key}) : super(key: key);

  @override
  _AgeInputState createState() => _AgeInputState();
}

class _AgeInputState extends State<AgeInput> {
  DateTime? _birthDate;
  String _message = '';

  void calculateAge() {
    final result = calculateRemainingLife(_birthDate);
    if (result != null) {
      setState(() {
        _message = 'You have approximately ${result['years']} years, ${result['months']} months, and ${result['days']} days left.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lifespan Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          birthDateDisplay(_birthDate),
          selectBirthDateButton(context, (picked) => setState(() => _birthDate = picked)),
          calculateButton(calculateAge),
          Center(child: Text(_message)),
        ],
      ),
    );
  }
}
