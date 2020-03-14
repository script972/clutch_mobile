import 'package:flutter/material.dart';

class CompanyScreen extends StatefulWidget {

  int id;
  CompanyScreen(this.id);

  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(child: Image.asset("assets/image/logo_foxtrot.png"),)
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    debugPrint("<<<<ID=${widget.id.toString()}");

  }

}
