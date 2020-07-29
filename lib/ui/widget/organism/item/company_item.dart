import 'package:clutch/core/custom_route.dart';
import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/presentation/bloc/company_details_bloc.dart';
import 'package:clutch/presentation/event/company_details_event.dart';
import 'package:clutch/ui/widget/atom/cached_network_image_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
          BlocProvider.of<CompanyDetailsBloc>(context)
              .add(LoadCompanyDetails(widget._companyResponse.id));
        },
        child: Card(
          elevation: 1,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          color:
              widget._companyResponse.color ?? Theme.of(context).primaryColor,
          child: Stack(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 36.0),
                  child: Hero(
                    tag: widget._companyResponse.id,
                    child: widget._companyResponse.logo.isNotEmpty
                        ? CachedNetworkImageWrapper(
                            widget._companyResponse.logo)
                        : Image.asset("assets/images/company_placeholder.png"),
                  ),
                ),
              ),
              widget._companyResponse.anchorPropositionResponse != null
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(200),
                          ),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.8),
                        ),
                        child: Text(
                          "${widget._companyResponse.anchorPropositionResponse.discount}${widget._companyResponse.anchorPropositionResponse.units}",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    )
                  : SizedBox(),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      color: Colors.red.withOpacity(0.8),
                      padding: EdgeInsets.only(bottom: 4.0, top: 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              widget._companyResponse.title,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )))
            ],
          ),
        ),
      );
}
