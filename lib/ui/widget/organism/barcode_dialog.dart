import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';

class BarcodeDialog extends StatelessWidget {
  final String barcode;

  BarcodeDialog(this.barcode);


  @override
  Widget build(BuildContext context) =>
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Column(
          children: <Widget>[
            Expanded(
                child: BarCodeImage(
                  params: Code39BarCodeParams(
                    this.barcode,
                    barHeight: 90.0,
                    withText: true,
                  ),
                  onError: (error) {
                    print('error = $error');
                  },
                )
            )
          ],
        ),
      );
}