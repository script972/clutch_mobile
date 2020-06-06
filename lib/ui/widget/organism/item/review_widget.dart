import 'package:clutch/presentation/model/comment_model_ui.dart';
import 'package:clutch/ui/widget/atom/rating_wrapper.dart';
import 'package:flutter/material.dart';


class ReviewWidget extends StatefulWidget {
  final CommentModelUi review;
  String userFullname = "Name";

  ReviewWidget(this.review, {Key key}) : super(key: key) {
    //var user = UserService.get(this.review.userId);
    //  this.userFullname = user.firstname + ' ' + user.lastname;
  }

  @override
  _ReviewWidgetState createState() {
    return _ReviewWidgetState();
  }
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: /*UserAvatar(this.widget.review.userId)*/ Image
                .asset('assets/images/ic_gear.png'),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.widget.userFullname,
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: RatingWrapper(widget.review.rang),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 19.0),
                  child: Text(this.widget.review.comment,
                      style: TextStyle(
                        color: Theme.of(context).textSelectionColor,
                        fontSize: 14.0,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
}
