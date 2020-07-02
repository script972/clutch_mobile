import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;

  const BaseScreen({@required this.child});

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) => Container(
      child: Stack(
        children: <Widget>[
          widget.child,
          // TODO: check internet connactivity
        ],
      ),
    );
}
