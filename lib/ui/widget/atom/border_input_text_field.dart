import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BorderedInputTextField extends StatefulWidget {
  @override
  _BorderedInputTextFieldState createState() => _BorderedInputTextFieldState();

  final FocusNode node;

  final bool obscure;
  final TextInputType textInputType;
  final String labelText;
  final TextEditingController controller;
  final TextInputAction action;
  final Function changeCallback;
  final String error;
  final ValueChanged<String> onFieldSubmitted;
  final EdgeInsets padding;
  final List<TextInputFormatter> inputFormatter;
  final TextCapitalization textCapitalization;
  final bool autofocus;
  final Key key;

  final bool isDeletableField;
  final Function deleteButtonPressed;

  BorderedInputTextField(
      {this.autofocus = false,
      this.node,
      this.key,
      this.obscure = false,
      this.textInputType = TextInputType.text,
      this.labelText,
      this.controller,
      this.changeCallback,
      this.onFieldSubmitted,
      this.padding = const EdgeInsets.fromLTRB(16, 26, 16, 0),
      this.action = TextInputAction.done,
      this.inputFormatter = const [],
      this.error = "",
      this.textCapitalization = TextCapitalization.none,
      this.isDeletableField = false,
      this.deleteButtonPressed});
}

class _BorderedInputTextFieldState extends State<BorderedInputTextField> {
  @override
  Widget build(BuildContext context) => Padding(
      key: widget.key,
      padding: widget.padding,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(Radius.circular(8.0)),
        ),
        child: TextFormField(
          autofocus: widget.autofocus,
          textCapitalization: widget.textCapitalization,
          inputFormatters: widget.inputFormatter,
          textInputAction: widget.action,
          onFieldSubmitted: widget.onFieldSubmitted,
          controller: widget.controller,
          obscureText: widget.obscure,
          keyboardType: widget.textInputType,
          focusNode: widget.node,
          onChanged: (val) => widget.changeCallback(val),
          decoration: InputDecoration(
            /*  suffixIcon: widget.isDeletableField
                  ? IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: widget.deleteButtonPressed)
                  : null,*/
              labelStyle: TextStyle(
                  color: getTextFieldColor(widget.node.hasFocus, widget.error)),
              labelText: widget.labelText,
              filled: false,
              enabledBorder: _border(
                  getTextFieldColor(widget.node.hasFocus, widget.error),
                  widget.error),
              focusedBorder: _border(
                  getTextFieldColor(widget.node.hasFocus, widget.error),
                  widget.error)),
        ),
      ),
    );

  @override
  void initState() {
    super.initState();
  }
}

InputBorder _border(Color color, String error) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: color, width: error.isEmpty ? 1 : 2));
}

Color getTextFieldColor(bool focused, String error) {
  if (error.length != 0) {
    return Colors.red;
  } else {
    if (focused) {
      return Colors.blue;
    } else {
      return Colors.blueGrey;
    }
  }
}
