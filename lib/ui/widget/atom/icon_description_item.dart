import 'package:flutter/material.dart';

class IconDescriptionItem extends StatelessWidget {
  String image;
  String title;
  Color color = Colors.black;

  IconDescriptionItem(this.image, this.title, {this.color});

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          children: <Widget>[
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Image.asset(
                        this.image,
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
          ],
        ),
      );
}
