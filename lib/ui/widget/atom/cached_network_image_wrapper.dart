import 'package:cached_network_image/cached_network_image.dart';
import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWrapper extends StatelessWidget {
  String image;

  CachedNetworkImageWrapper(this.image);

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
        errorWidget: (context, url, error) {
          debugPrint("<<<<<<${url} <<<<${error}");
          return Icon(Icons.error);
        },
    useOldImageOnUrlChange: true,
  );
}