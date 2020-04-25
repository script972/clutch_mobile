import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class OfferItem extends StatelessWidget {
  final int id;
  final bool global;
  final String title;
  final String subTitle;
  final String image;
  StaggeredTile staggeredTile;

  OfferItem(this.id, this.title, this.image,
      {this.subTitle, this.global = false}) {
    if (global)
      this.staggeredTile = const StaggeredTile.count(4, 2.25);
    else
      this.staggeredTile = const StaggeredTile.count(2, 2.65);
    /*if (global)
      this.staggeredTile = const StaggeredTile.count(4, 2.25);
    else
      this.staggeredTile = const StaggeredTile.count(2, 2.25);*/
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 8.0,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(80, 0, 0, 0),
                          Color.fromARGB(80, 0, 0, 0),
                          Colors.transparent,
                        ],
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                        stops: [0.0, 0.1, 0.3],
                        tileMode: TileMode.clamp),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(this.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                      Text(this.subTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          )),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
