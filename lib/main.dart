import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const AgeCalculator());
}

class AgeCalculator extends StatelessWidget {
  const AgeCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AgeInput(),
    );
  }
}

class AgeInput extends StatefulWidget {
  const AgeInput({super.key});

  @override
  _AgeInputState createState() => _AgeInputState();
}

class _AgeInputState extends State<AgeInput> {
  DateTime? _birthDate;
  String _message = '';

  void calculateAge() {
    if(_birthDate != null){
      final currentDate = DateTime.now();
      int years = currentDate.year - _birthDate!.year;
      if (_birthDate!.month > currentDate.month ||
          (_birthDate!.month == currentDate.month && _birthDate!.day > currentDate.day)) {
        years--;
      }
      final remainingYears = 80 - years; // Assume average lifespan is 80 years
      setState(() {
        _message = 'You have approximately $remainingYears years left.';
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
          Center(
            child: Text(
              _birthDate == null ? 'Enter your birth date' : 'Birth date: ${DateFormat('yyyy-MM-dd').format(_birthDate!)}',
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _birthDate == null ? DateTime.now() : _birthDate!,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null && picked != _birthDate) {
                  setState(() {
                    _birthDate = picked;
                  });
                }
              },
              child: const Text('Select birth date'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: calculateAge,
              child: const Text('Calculate remaining years'),
            ),
          ),
          Center(child: Text(_message)),
        ],
      ),
    );
  }
}