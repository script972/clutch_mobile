import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/presentation/bloc/company_details_bloc.dart';
import 'package:clutch/presentation/event/company_details_event.dart';
import 'package:clutch/ui/widget/atom/cached_network_image_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:clutch/core/custom_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyItem extends StatefulWidget {
  CompanyShortMobile _companyResponse;

  CompanyItem(this._companyResponse);

  @override
  _CompanyItemState createState() => _CompanyItemState();
}

class _CompanyItemState extends State<CompanyItem> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, CustomRoute.DETAILS_COMPANY,
              arguments: widget._companyResponse.id);
          BlocProvider.of<CompanyDetailsBloc>(context).add(LoadCompanyDetails(widget._companyResponse.id));
        },
        child: Card(
          elevation: 1,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: widget._companyResponse.color ?? Theme.of(context).primaryColor,
          child: Hero(
            tag: widget._companyResponse.id,
            child: CachedNetworkImageWrapper(widget._companyResponse.logo),
          ),
        ),
      );
}
