import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  TabController tabController;

  SearchAppBar(this.tabController);

  @override
  _SearchAppBarState createState() => new _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(104.0);
}

class _SearchAppBarState extends State<SearchAppBar> {
  Widget appBarTitle = Text("Корпоратив");
  Icon actionIcon = Icon(Icons.search);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 8.0,
      leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: IconButton(
            icon: Image.asset("assets/images/ic_menu.png"),
            onPressed: () {},
          )),
      title: appBarTitle,
      bottom: TabBar(
        unselectedLabelColor: Colors.white.withOpacity(0.56),
        tabs: [Tab(text: 'Предложения'), Tab(text: 'Компании')],
        indicatorColor: Colors.red,
        labelColor: Colors.white,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Colors.white),
            insets: EdgeInsets.symmetric(horizontal: 12.0)),
        controller: widget.tabController,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon = new Icon(Icons.close);
                this.appBarTitle = new TextField(
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.white),
                    //hintText: ClutchLocalizations.of(context).h_search,
                    hintStyle: new TextStyle(color: Colors.white),
                  ),
                );
              } else {
                this.actionIcon = new Icon(Icons.search);
                this.appBarTitle = new Text("Корпоратка");
              }
            });
          },
        ),
        IconButton(
          icon: Image.asset('assets/images/ic_gear.png'),
          onPressed: () {},
        ),
      ],
    );
  }
}