import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/streamdataprovider.dart';

class HomeScreenBanner extends StatelessWidget {
  HomeScreenBanner({super.key,});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<StreamedDataProvider>(builder: (context, provider, child) {
      return SizedBox(
        height: size.height * 0.36,
        width: double.infinity,
        child: provider.streamedData.isEmpty
            ? const Center(
          child: CircularProgressIndicator(),
        )
            :
        Image.network(
          provider.streamedData['DATA']['headerList'][0]['img_url'],
          fit: BoxFit.fill,
          loadingBuilder:  (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if(loadingProgress==null)
            {
              return child;
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
    });
  }
}
