import 'package:clutch/presentation/bloc/main_bloc.dart';
import 'package:clutch/presentation/model/place_model_ui.dart';
import 'package:clutch/presentation/state/main_state.dart';
import 'package:clutch/ui/widget/atom/loader_indicator.dart';
import 'package:clutch/ui/widget/organism/tab/locations_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsBigTab extends StatefulWidget {
  final List<PlaceModelUi> places;
  LatLng camera;

  MapsBigTab(this.places, this.camera);

  @override
  _MapsBigTabState createState() => _MapsBigTabState();
}

class _MapsBigTabState extends State<MapsBigTab> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MainBloc, MainState>(builder: (context, state) {
        if (state is MainLoaded) {
          return LocationsTab(state.places, state.userPosition);
        } else if (state is MainLoading) {
          return LoaderIndicator();
        }
      });
}
