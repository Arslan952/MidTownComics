import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/streamdataprovider.dart';

class Slider3 extends StatefulWidget {
  List<dynamic>data;
   Slider3({Key? key,required this.data});

  @override
  State<Slider3> createState() => _Slider3State();
}

class _Slider3State extends State<Slider3> {

  void _precacheImages(List<dynamic> imageUrls) {
    for (final imageUrl in imageUrls) {
      precacheImage(NetworkImage(imageUrl['image_url']),context);
    }
  }
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize=MediaQuery.of(context).size.height+MediaQuery.of(context).size.width;
    _precacheImages(widget.data);
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Stack(
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                itemCount: widget.data.length, // Use the length of your data list
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                  // Access the data from your list using itemIndex
                  final item = widget.data[itemIndex];
                  return Container(
                    height: size.height*0.52,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                      color: Colors.white
                    ),
                    child: Image.network(
                      item['image_url'], // Use the 'image' field from your data
                      fit:MediaQuery.of(context).size.shortestSide < 550? BoxFit.fill:BoxFit.fill,
                      loadingBuilder:  (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if(loadingProgress==null)
                        {
                          return child;
                        }
                        else{
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                      // width: size.width, // Adjust the width as needed
                    ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  viewportFraction: 1, // Adjust the viewportFraction as needed
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              Positioned(
                bottom: size.height*0.03,
                left: size.width*0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.data.asMap().entries.map((entry) {
                    return Container(
                      width:allsize*0.013,
                      height: allsize*0.013,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[800]!),
                        color: _currentIndex == entry.key
                            ? Colors.grey[300]
                            : Colors.transparent,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
