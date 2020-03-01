import 'package:flutter/material.dart';

class OfferItem extends StatelessWidget {
  final int id;
  final bool global;
  final String title;
  final String subTitle;
  final String images;


  final width = 160.0;
  final height = 160.0;

  final widthGlobal = 328.0;
  final heightGlobal = 180.0;


  OfferItem(this.id, this.title, this.images, {this.subTitle, this.global = false});



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(images),
              ),
            ),
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.center,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black87,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
            ),
            Positioned(
              width: width,
              height: height,
              child: Align(
                alignment: FractionalOffset.bottomLeft,
                child: ListTile(
                  dense: true,
                  title: Text(
                    "Название акции lorem",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  subtitle: Text(
                    "до 12.01.2019",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.54), fontSize: 10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
