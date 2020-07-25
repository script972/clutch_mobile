import 'package:flutter/material.dart';

class LoaderIndicator extends StatelessWidget {
  final bool showOnColor;

  const LoaderIndicator({this.showOnColor = false});

  @override
  Widget build(BuildContext context) => showOnColor
      ? Center(
          child: Container(
              padding: EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: CircularProgressIndicator()))
      : Center(child: CircularProgressIndicator());
}
