import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatefulWidget {
  final String about;
  final String title;

  AboutWidget(this.title, this.about, {Key key}) : super(key: key);

  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  ExpandableController _expandableController;
  bool _expandableButtonTextFlag = false;

  @override
  void initState() {
    super.initState();
    _expandableController = ExpandableController(initialExpanded: false);
  }

  @override
  Widget build(BuildContext context) => Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Icon(
                  Icons.info_outline,
                  size: 20.0,
                  color: Colors.black.withOpacity(0.38),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.54),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                subtitle: Expandable(
                  collapsed: Text(
                    widget.about,
                    softWrap: true,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    widget.about,
                    softWrap: true,
                  ),
                  controller: _expandableController,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                setState(() {
                  _expandableController.toggle();
                  _expandableButtonTextFlag = !_expandableButtonTextFlag;
                });
              },
              child: Text(
                (_expandableButtonTextFlag ? 'Свернуть' : 'Детальнее')
                    .toUpperCase(),
                style: TextStyle(
                    color: _expandableButtonTextFlag
                        ? Color(0xFFFF473D)
                        : Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        )
      ],
    );
}
