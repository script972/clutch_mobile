import 'package:clutch/domain/network/model/response/anchor_proposition_response.dart';
import 'package:clutch/presentation/model/comment_model_ui.dart';
import 'package:clutch/presentation/model/company_details_model_ui.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:clutch/ui/widget/atom/company_header.dart';
import 'package:clutch/ui/widget/organism/about_widget.dart';
import 'package:clutch/ui/widget/organism/item/review_slider.dart';
import 'package:clutch/ui/widget/organism/item/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyDetailsTab extends StatefulWidget {
  final CompanyDetailsModelUi company;

  CompanyDetailsTab(this.company, {Key key}) : super(key: key);

  @override
  _CompanyDetailsTabState createState() => _CompanyDetailsTabState();
}

class _CompanyDetailsTabState extends State<CompanyDetailsTab> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CompanyHeader(widget.company),
                showAnchorProposition(widget.company.anchorPropositionResponse),
                Divider(),
                AboutWidget(
                    translate(Keys.About_Company), widget.company.description),
                Divider(),
                phoneAndNetwork(widget.company),
                socialLink(widget.company),
                /* WorkSchedule(),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, bottom: 8.0),
                  child: Text('График работы ближайшей к вам локации компании'),
                ),*/
                /* Divider(),*/
                /* Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Отзывы',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.54),
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                //convert to list
                ...buildReviewsList(context, widget.commentList),*/
              ]),
        ),
      );

  List<Widget> buildReviewsList(
          BuildContext context, List<CommentModelUi> reviews) =>
      reviews.isNotEmpty
          ? reviews
              //  .take(this.maxCount)
              .map(
                (review) => review.isMyComment
                    ? SlideableReviewWrapper(
                        removeCallback: () {},
                        /*this._removeCbFactory(review.id),*/
                        editCallback: () {},
                        /*this._editCbFactory(review),*/
                        child: Container(
                          child: ReviewWidget(review),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              border: Border(
                                  left: BorderSide(
                                      width: 3.0,
                                      color: Theme.of(context).hintColor))),
                        ),
                      )
                    : ReviewWidget(review),
              )
              .toList()
          : [
              Center(
                child: Text(
                  'Пока что не оставлено не одного отзыва',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).errorColor),
                ),
              )
            ];

  Widget showAnchorProposition(
      AnchorPropositionResponse anchorPropositionResponse) {
    if (anchorPropositionResponse == null) return SizedBox();
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: TextStyle(color: Colors.white, fontSize: 36.0),
                children: [
                  TextSpan(
                    text: '${anchorPropositionResponse.discount}',
                  ),
                  TextSpan(
                    text: '${anchorPropositionResponse.units}',
                  ),
                  TextSpan(
                      text: translate(Keys.Discount),
                      style: TextStyle(
                        fontSize: 22.0,
                      )),
                ]),
          ),
          (widget.company.anchorPropositionResponse.conditionDescription ==
                      null ||
                  widget.company.anchorPropositionResponse.conditionDescription
                      .isEmpty)
              ? SizedBox()
              : Text(
                  '**${widget.company.anchorPropositionResponse.conditionDescription}'),
        ],
      ),
    );
  }

  Widget socialLink(CompanyDetailsModelUi company) {
    return Row(
      children: <Widget>[
        (company.instargamUrl == null || company.instargamUrl.isEmpty)
            ? SizedBox()
            : Expanded(
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 0.8,
                      ),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Material(
                    borderRadius: BorderRadius.circular(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () async {
                        var url =
                            'https://instagram.com/foxtrot_com_ua/${company.instargamUrl}';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $company.instargamUrl';
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child:
                                  Image.asset('assets/images/ic_instargam.png'),
                            ),
                            Text('Instagram'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
        (company.facebookUrl == null || company.facebookUrl.isEmpty)
            ? SizedBox()
            : Expanded(
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 0.8,
                      ),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Material(
                    borderRadius: BorderRadius.circular(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () async {
                        var url =
                            'https://www.facebook.com/${company.facebookUrl}/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $company.facebookUrl';
                        }
                        ;
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child:
                                  Image.asset('assets/images/ic_facebook.png'),
                            ),
                            Text('Facebook'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }

  Widget phoneAndNetwork(CompanyDetailsModelUi company) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          widget.company.phone.isNotEmpty
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(translate(Keys.Phone_Number)),
                      ),
                      GestureDetector(
                          onTap: () {
                            launch('tel://${widget.company.phone}');
                          },
                          child: Text(
                            widget.company.phone.toString(),
                            style: TextStyle(color: Colors.lightBlue),
                          )),
                    ],
                  ),
                )
              : SizedBox(),
          (widget.company.phone.isNotEmpty && widget.company.site.isNotEmpty)
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 42.0,
                    width: 1.0,
                    color: Colors.grey,
                  ),
                )
              : SizedBox(),
          widget.company.site.isNotEmpty
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(translate(Keys.Web_Site)),
                      ),
                      GestureDetector(
                          onTap: () async {
                            var url = 'https://${company.site}/';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                            ;
                          },
                          child: Text(
                            widget.company.site.toString(),
                            style: TextStyle(color: Colors.lightBlue),
                          )),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
