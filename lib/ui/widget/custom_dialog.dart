import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/ui/screen/profile_screen.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Вы действительно хотите открыть настройки?",
                style: TextStyle(color: Colors.black12, fontSize: 22.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Да"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Нет"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            ],
          )),
    );
  }
}
