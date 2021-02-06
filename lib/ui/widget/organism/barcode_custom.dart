import 'package:clutch/ui/widget/organism/barcode_dialog.dart';
import 'package:flutter/material.dart';

class BarcodeCustom extends StatelessWidget {
  final String barcode;

  const BarcodeCustom(this.barcode);

  @override
  Widget build(BuildContext context) => barcode.isNotEmpty
      ? IconButton(
          icon: Image.asset('assets/images/ic_barcode.png'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => BarcodeDialog(barcode),
            );
          },
        )
      : SizedBox();
}
