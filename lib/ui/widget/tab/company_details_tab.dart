import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/repository/model/response/company_response.dart';
import 'package:flutter_clutch_mobile/ui/widget/about_company.dart';
import 'package:flutter_clutch_mobile/ui/widget/company_header.dart';
import 'package:flutter_clutch_mobile/ui/widget/work_shedule.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompanyDetailsTab extends StatefulWidget {
  final CompanyResponse company;
  final String comment =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

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
                AboutCompany(),
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
                Dismissible(
                  key: Key(''),
                  direction: DismissDirection.endToStart,
                  background: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            alignment: AlignmentDirectional.centerEnd,
                            color: Color(0xFFFF473D),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: AlignmentDirectional.centerEnd,
                            color: Color(0xFF3C83EE),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  child: Container(
                    color: Color(0xFFF6F6F6),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              color: Theme.of(context).primaryColor,
                              width: 3.0,
                              height: 160.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    'assets/images/ic_star.png',
                                    scale: 2,
                                  )),
                              Expanded(
                                flex: 6,
                                child: ListTile(
                                  title: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: Column(
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Text('My Comment')),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: FlutterRatingBar(
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 2.0),
                                              fullRatingWidget: Image.asset(
                                                'assets/images/ic_star.png',
                                                scale: 4,
                                              ),
                                              noRatingWidget: Image.asset(
                                                'assets/images/ic_star_active.png',
                                                scale: 4,
                                              ),
                                              initialRating: 4,
                                              itemSize: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  subtitle: Text(widget.comment),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                commentsList(),
              ]),
        ),
      );

  Widget commentsList() => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 1, child: Image.asset('assets/images/avatar.png')),
                Expanded(
                  flex: 6,
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Column(
                          children: <Widget>[
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text('User 1')),
                            Align(
                              alignment: Alignment.topLeft,
                              child: FlutterRatingBar(
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0),
                                fullRatingWidget: Image.asset(
                                  'assets/images/ic_star.png',
                                  scale: 4,
                                ),
                                noRatingWidget: Image.asset(
                                  'assets/images/ic_star_active.png',
                                  scale: 4,
                                ),
                                initialRating: 4,
                                itemSize: 25,
                                onRatingUpdate: (_) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    subtitle: Text(widget.comment),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 1, child: Image.asset('assets/images/avatar.png')),
                Expanded(
                  flex: 6,
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Column(
                          children: <Widget>[
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text('User 2')),
                            Align(
                              alignment: Alignment.topLeft,
                              child: FlutterRatingBar(
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0),
                                fullRatingWidget: Image.asset(
                                  'assets/images/ic_star.png',
                                  scale: 4,
                                ),
                                noRatingWidget: Image.asset(
                                  'assets/images/ic_star_active.png',
                                  scale: 4,
                                ),
                                initialRating: 2,
                                itemSize: 25,
                                onRatingUpdate: (_) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    subtitle: Text(
                      widget.comment,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text(
                  ('Все отзывы').toUpperCase(),
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      );
}
