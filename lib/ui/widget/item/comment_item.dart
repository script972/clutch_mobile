import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/ui/model/comment_model_ui.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommentItem extends StatefulWidget {
  CommentModelUi model;

  CommentItem(this.model);

  @override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) => widget.model.isMyComment
      ? Dismissible(
          key: Key(''),
          direction: DismissDirection.endToStart,
          background: backgroundContent(),
          child: mainContent(),
        )
      : mainContent();

  Widget mainContent() => Container(
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: <Widget>[
            widget.model.isMyComment
                ? Positioned(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        width: 3.0,
                        height: 160.0,
                      ),
                    ),
                  )
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Image.network(
                        widget.model.avatar,
                        scale: 2,
                      )),
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
                                  child: Text(widget.model.name)),
                              Align(
                                alignment: Alignment.topLeft,
                                child: FlutterRatingBar(
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  fullRatingWidget: Image.asset(
                                    'assets/images/ic_star_active.png',
                                  ),
                                  noRatingWidget: Image.asset(
                                    'assets/images/ic_star.png',
                                  ),
                                  initialRating: widget.model.rang.toDouble(),
                                  itemSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      subtitle: Text(widget.model.comment),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget backgroundContent() => Align(
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
      );
}
