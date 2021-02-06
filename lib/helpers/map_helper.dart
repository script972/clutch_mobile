import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHelper {
  static Future<BitmapDescriptor> getAssetImageMarker(
      String pathToImage) async {
    var icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 3.2),
        'assets/images/markeruser.png');
    return icon;
  }

  static Future<BitmapDescriptor> getNetworkImageMarker(String imageUrl) async {
    final markerImageFile = await DefaultCacheManager().getSingleFile(imageUrl);
    final markerImageBytes = await markerImageFile.readAsBytes();
    final markerImageBytesWithSize =
        await getBytesFromCanvas(150, 150, markerImageBytes);
    var bitmapDescriptor = BitmapDescriptor.fromBytes(markerImageBytesWithSize);
    return bitmapDescriptor;
  }

  static Future<Uint8List> getBytesFromCanvas(
      int width, int height, Uint8List dataBytes) async {
    final pictureRecorder = PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final paint = Paint()..color = Colors.transparent;
    final radius = Radius.circular(20.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);

    var imaged = await decodeImageFromList(dataBytes);
    canvas.drawImageRect(
      imaged,
      Rect.fromLTRB(
          0.0, 0.0, imaged.width.toDouble(), imaged.height.toDouble()),
      Rect.fromLTRB(0.0, 0.0, width.toDouble(), height.toDouble()),
      Paint(),
    );

    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ImageByteFormat.png);
    return data.buffer.asUint8List();
  }
}
