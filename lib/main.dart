import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(AgeCalculator());
}

class AgeCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AgeInput(),
    );
  }
}

class AgeInput extends StatefulWidget {
  @override
  _AgeInputState createState() => _AgeInputState();
}

class _AgeInputState extends State<AgeInput> {
  final TextEditingController _controller = TextEditingController();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String _message = '';

  void calculateAge() {
    final birthDate = DateTime.parse(_controller.text);
    final currentDate = DateTime.now();
    int years = currentDate.year - birthDate.year;
    if (birthDate.month > currentDate.month ||
        (birthDate.month == currentDate.month && birthDate.day > currentDate.day)) {
      years--;
    }
    final remainingYears = 80 - years; // Assume average lifespan is 80 years
    setState(() {
      _message = 'You have approximately $remainingYears years left.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lifespan Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter your birth date',
                hintText: 'yyyy-MM-dd',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: calculateAge,
            child: Text('Calculate remaining years'),
          ),
          Text(_message),
        ],
      ),
    );
  }
}