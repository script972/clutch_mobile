import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ShortOfferModelUi {
  final int id;
  final String imageUrl;
  final String title;
  String subTitle;
  StaggeredTile staggeredTile;

  ShortOfferModelUi(this.id, this.imageUrl, this.title, this.subTitle,
      {this.staggeredTile = const StaggeredTile.count(4, 2.25)});
}
