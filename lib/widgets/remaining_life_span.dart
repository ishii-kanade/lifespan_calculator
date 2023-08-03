import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../age_calculator_viewmodel.dart';

Widget remainingLifeSpan(BuildContext context) {
  final viewModel = Provider.of<AgeCalculatorViewModel>(context);
  return Center(child: Text(viewModel.message));
}