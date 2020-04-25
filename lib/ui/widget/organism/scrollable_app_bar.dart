import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/domain/network/model/response/company_response.dart';
import 'package:flutter_clutch_mobile/ui/widget/atom/sliver_app_bar.dart';

class ScrollableAppBar extends StatefulWidget {
  final CompanyResponse company;
  final TabController _companyTabController;

  ScrollableAppBar(this.company, this._companyTabController);

  @override
  _ScrollableAppBarState createState() => _ScrollableAppBarState();
}

class _ScrollableAppBarState extends State<ScrollableAppBar> {
  bool hideFlexibleSpace = false;

  @override
  Widget build(BuildContext context) => SliverAppBar(
    backgroundColor: widget.company.color,
    expandedHeight: hideFlexibleSpace ? 0.0 : 200.0,
    elevation: 0.0,
    pinned: true,
    leading: IconButton(
      color: blackOrWhite(),
      padding: EdgeInsets.only(left: 6.0),
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: SliverAppBarComponent(
      hiddenChild: Row(
        children: <Widget>[
          Image.asset(widget.company.image, scale: 4),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(widget.company.title,
                style: TextStyle(
                  color: blackOrWhite(),
                  fontSize: 20,
                )),
          ),
        ],
      ),
      expandedChild: SizedBox(),
    ),
    flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Hero(
          tag: widget.company.image,
          child: Image.asset(
            widget.company.image,
            scale: 1.5,
          ),
        )),
    bottom: TabBar(
      onTap: (tab) {
        setState(() {
          if (widget._companyTabController.index == 2)
            hideFlexibleSpace = true;
          else
            hideFlexibleSpace = false;
        });
      },
      unselectedLabelColor: blackOrWhite().withOpacity(0.56),
      labelColor: blackOrWhite(),
      isScrollable: true,
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 3.0, color: blackOrWhite()),
          insets: EdgeInsets.symmetric(horizontal: 12.0)),
      tabs: [
        Tab(text: "Предложения"),
        Tab(text: "Подробнее"),
        Tab(text: "Локации"),
      ],
      controller: widget._companyTabController,
    ),
  );

  Color blackOrWhite() => widget.company.color == Colors.white ? Colors.black : Colors.white;
}
