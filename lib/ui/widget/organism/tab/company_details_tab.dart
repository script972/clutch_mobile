import 'package:clutch/presentation/model/comment_model_ui.dart';
import 'package:clutch/presentation/model/company_details_model_ui.dart';
import 'package:clutch/ui/widget/organism/item/review_slider.dart';
import 'package:clutch/ui/widget/organism/item/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:clutch/ui/widget/organism/about_widget.dart';
import 'package:clutch/ui/widget/atom/company_header.dart';

class CompanyDetailsTab extends StatefulWidget {
  final CompanyDetailsModelUi company;

  List<CommentModelUi> commentList = [];

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
                Divider(),
                AboutWidget("О компании", widget.company.description),
                /* Divider(),
                WorkSchedule(),
                Divider(),*/
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
                  "Пока что не оставлено не одного отзыва",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).errorColor),
                ),
              )
            ];
}
