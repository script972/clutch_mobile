import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:flutter/material.dart';
import 'package:clutch/ui/model/comment_model_ui.dart';
import 'package:clutch/ui/widget/organism/about_company.dart';
import 'package:clutch/ui/widget/atom/company_header.dart';
import 'package:clutch/ui/widget/item/review_slider.dart';
import 'package:clutch/ui/widget/item/review_widget.dart';
import 'package:clutch/ui/widget/organism/work_shedule.dart';

class CompanyDetailsTab extends StatefulWidget {
  final CompanyShortMobile company;
  final String comment =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';
  final String description =
      ' немецкий промышленный концерн, специализирующийся на выпуске и продаже '
      'спортивной обуви, одежды и инвентаря под торговыми марками adidas и Reebok. '
      'Генеральный директор компании — Каспер Рорштед (с октября 2016). Название '
      'компании, как и торговой марки, принято писать со строчной буквы — adidas.';

  List<CommentModelUi> commentList = [];

  CompanyDetailsTab(this.company, {Key key}) : super(key: key);

  @override
  _CompanyDetailsTabState createState() => _CompanyDetailsTabState();
}

class _CompanyDetailsTabState extends State<CompanyDetailsTab> {
  @override
  void initState() {
    super.initState();
    widget.commentList.add(CommentModelUi(
        id: 1,
        avatar:
            "https://lh3.googleusercontent.com/proxy/h7surq-r3DO1WgU4lKTx3IKqjDnyQQ-7gFo9hGKm8P67uI28Kg7Q7Xusp-2O76AaG_3NIEh8DudG6nae-6hPx56Ou2fP5kPdu5d8Gh1EE2lBk8SYy7MVsy0rv3EFXc47_x0",
        comment: widget.comment,
        isMyComment: true,
        name: "Денис",
        rang: 4));

    widget.commentList.add(CommentModelUi(
        id: 1,
        avatar: "https://i.imgur.com/I80W1Q0.png",
        comment: widget.comment,
        isMyComment: false,
        name: "Extrawest",
        rang: 5));
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CompanyHeader(widget.company),
                Divider(),
                AboutCompany(widget.description),
                Divider(),
                WorkSchedule(),
                Divider(),
                Padding(
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
                ...buildReviewsList(context, widget.commentList),
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
