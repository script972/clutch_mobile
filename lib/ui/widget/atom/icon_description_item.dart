import 'package:flutter/material.dart';

class IconDescriptionItem extends StatelessWidget {
  String image;
  String title;
  Color color = Colors.black;
  Function callback;

  IconDescriptionItem(this.image, this.title, {this.color, this.callback});

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          children: <Widget>[
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: GestureDetector(
                onTap: callback,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Image.asset(
                          this.image,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(title, style: TextStyle(fontSize: 16.0, color: this.color),),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
