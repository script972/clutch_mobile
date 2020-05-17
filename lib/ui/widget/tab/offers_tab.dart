import 'package:clutch/presentation/bloc/main_bloc.dart';
import 'package:clutch/presentation/model/short_offer_model_ui.dart';
import 'package:clutch/presentation/state/main_state.dart';
import 'package:flutter/material.dart';
import 'package:clutch/ui/widget/item/offer_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class OffersTab extends StatelessWidget {
  final List<ShortOfferModelUi> offers;

  OffersTab(this.offers);

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.only(top: 8.0),
      child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
        if (state is MainLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is MainLoaded) {
          return StaggeredGridView.countBuilder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 4,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            itemCount: this.offers?.length ?? 0,
            itemBuilder: (BuildContext context, int index) =>
                OfferItem(offers[index]),
            staggeredTileBuilder: (int index) => offers[index].staggeredTile,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          );
        }
        return Text("something wrong");
      }));
}
