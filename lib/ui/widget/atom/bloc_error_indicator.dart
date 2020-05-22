import 'package:flutter/material.dart';

class BlocErrorIndicator extends StatelessWidget {

  String error;

  BlocErrorIndicator(this.error);

  @override
  Widget build(BuildContext context) => Text("Something wrong ${error}");
}
