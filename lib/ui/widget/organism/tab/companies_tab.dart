import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/presentation/bloc/main_bloc.dart';
import 'package:clutch/presentation/state/main_state.dart';
import 'package:clutch/ui/widget/organism/item/company_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesTab extends StatelessWidget {

  List<CompanyShortMobile> companyList;

  CompaniesTab(this.companyList);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MainBloc, MainState>(builder: (context, state) {
        if (state is MainLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is MainError) {
          return Center(
              child: Image.asset("assets/images/nothing_to_show.png"));
        }
        if (state is MainLoaded) {
          return Container(
            padding: EdgeInsets.only(top: 0, left: 8.0, right: 8.0),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 2.3 / 2,
              children: state.company
                  .map((CompanyShortMobile item) => CompanyItem(item))
                  .toList(),
            ),
          );
        }
        return Text("Somthing went wrong!");
      });
}
