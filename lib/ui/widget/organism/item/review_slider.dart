import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlideableReviewWrapper extends StatefulWidget {
  final Widget child;
  final void Function() removeCallback;
  final void Function() editCallback;

  SlideableReviewWrapper(
      {this.removeCallback, this.editCallback, this.child, Key key})
      : super(key: key);

  @override
  _SlideableReviewWrapperState createState() {
    return _SlideableReviewWrapperState();
  }
}

class _SlideableReviewWrapperState extends State<SlideableReviewWrapper> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      child: widget.child,
      secondaryActions: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: IconSlideAction(
                color: Theme.of(context).errorColor,
                icon: Icons.delete,
                onTap: () => {widget.removeCallback()},
              ),
            ),
            Expanded(
              child: IconSlideAction(
                color: Theme.of(context).highlightColor,
                icon: Icons.mode_edit,
                onTap: () => {widget.editCallback()},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
