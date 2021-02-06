import 'package:flutter/material.dart';

class BlocErrorIndicator extends StatelessWidget {
  final String error;

  const BlocErrorIndicator(this.error);

  @override
  Widget build(BuildContext context) => Text('Something wrong ${error}');
}
