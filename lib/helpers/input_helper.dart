import 'package:flutter/material.dart';

class InputHelper {}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

changeFocus(BuildContext context, FocusNode node) =>
    FocusScope.of(context).requestFocus(node);
