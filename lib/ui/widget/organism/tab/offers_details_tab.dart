import 'package:clutch/core/custom_route.dart';
import 'package:clutch/presentation/bloc/company_details_bloc.dart';
import 'package:clutch/presentation/event/company_details_event.dart';
import 'package:clutch/presentation/model/offer_details_model_ui.dart';
import 'package:clutch/ui/widget/atom/icon_description_item.dart';
import 'package:clutch/ui/widget/organism/about_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class OffersDetailsTab extends StatefulWidget {
  final OfferDetailsModelUi offer;

  OffersDetailsTab(this.offer);

  @override
  _OffersDetailsTabState createState() => _OffersDetailsTabState();
}

class _OffersDetailsTabState extends State<OffersDetailsTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
          Widget>[
        /*CompanyHeader(widget.company)*/
        Divider(),
        AboutWidget("О предложении", widget.offer.description),
        IconDescriptionItem(
          "assets/images/ic_calendar.png",
          widget.offer.duration,
        ),
        widget.offer.phone.isNotEmpty
            ? IconDescriptionItem(
                'assets/images/ic_phone.png',
                widget.offer.phone,
                color: Colors.red,
                callback: () {
                  launch("tel://${widget.offer.phone}");
                },
              )
            : SizedBox(),
        widget.offer.companyShortMobile != null
            ? IconDescriptionItem(
          'assets/images/ic_company.png',
          widget.offer.companyShortMobile.title,
          color: Colors.red,
          callback: () {
            Navigator.pushNamed(context, CustomRoute.DETAILS_COMPANY,
                arguments: widget.offer.companyShortMobile.id);
            BlocProvider.of<CompanyDetailsBloc>(context).add(
                LoadCompanyDetails(widget.offer.companyShortMobile.id));
          },
              )
            : SizedBox(),
        /*WorkSchedule(),
            Divider(),*/
      ]),
    );
  }
}
