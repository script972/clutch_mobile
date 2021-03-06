import 'package:clutch/core/theme_custom.dart';
import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/presentation/bloc/main_bloc.dart';
import 'package:clutch/presentation/state/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesDrawer extends StatefulWidget {
  @override
  _CategoriesDrawerState createState() => _CategoriesDrawerState();
}

class _CategoriesDrawerState extends State<CategoriesDrawer> {
  @override
  Widget build(BuildContext context) => Drawer(
        child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
          if (state is MainLoaded) {
            return Container(
              decoration: BoxDecoration(gradient: ThemeCustom.mainGradient),
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[...categories(state.categories)],
              ),
            );
          }
        }),
      );

  List<Widget> categories(List<CategoriesResponse> categories) {
    List out = <Widget>[];
    categories.forEach((element) {
      out.add(CheckboxListTile(
        title: Text(element.title),
        value: true,
        onChanged: (newValue) {
          setState(() {
          //checkedValue = newValue;
        });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ));
    });
    return out;
  }
}
