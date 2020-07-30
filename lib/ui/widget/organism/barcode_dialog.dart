import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarcodeDialog extends StatelessWidget {
  final String barcode;

  const BarcodeDialog(this.barcode);

  @override
  Widget build(BuildContext context) => Dialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        barcode?.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 36.0),
                      ))),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: BarCodeImage(
                      params: Code39BarCodeParams(
                        this.barcode,
                        barHeight: 90.0,
                        withText: false,
                      ),
                      onError: (error) {
                        print('error = $error');
                      },
                    ))
                  ],
                ),
              ),
          /*    Align(alignment: Alignment.topRight,child: Icon(Icons.close)),*/
            ],
          ),
        ),
      );
}
