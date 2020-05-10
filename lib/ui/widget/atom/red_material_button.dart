import 'package:flutter/material.dart';

class RedMaterialButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const RedMaterialButton(
      {Key key,
      this.title,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
      child: MaterialButton(
        onPressed: onPressed,
        color: Color(0xFFFF473D),
        splashColor: Colors.redAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom:16.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
