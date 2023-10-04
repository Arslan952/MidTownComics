import 'package:flutter/material.dart';

class FeatureNewRelease extends StatefulWidget {
  // String title;
  String? title, prce1, price2, image, pulllist, preorder, adultimage;
  int? quantity;

  FeatureNewRelease(
      {super.key,
      this.title,
      this.preorder,
      this.prce1,
      this.price2,
      this.image,
      this.pulllist,
      this.quantity,
        this.adultimage
      });

  @override
  State<FeatureNewRelease> createState() => _FeatureNewReleaseState();
}

class _FeatureNewReleaseState extends State<FeatureNewRelease> {
  @override
  Widget build(BuildContext context) {
    double percent =
        ((double.parse(widget.prce1!) - double.parse(widget.price2!)) /
                double.parse(widget.prce1!)) *
            100;
    String stringValue = percent.toString();
    List<String> parts = stringValue.split('.');
    String partBeforeDecimal = parts[0];
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          width: size.width * 0.445,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: size.height * 0.2,
                  width: size.width * 0.3,
                  child: Image.network(
                    widget.adultimage == '0'
                        ? "https://www.midtowncomics.com/images/PRODUCT/FUL/${widget.image}_ful.jpg"
                        : 'https://www.midtowncomics.com/images/PRODUCT/FUL/adults_ful.jpg',
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                    // fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: size.height * 0.06,
                child: Text(
                  widget.title!.isNotEmpty
                      ? widget.title!
                      : "Magneto Vol 4 #2 Cover a regular To",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: allsize * 0.013),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              double.parse(widget.prce1!) == double.parse(widget.price2!)
                  ? Container(
                      height: size.height * 0.03,
                    )
                  : Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${widget.prce1}",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold,
                                fontSize: allsize * 0.0115),
                          ),
                          Container(
                            height: size.height * 0.03,
                            width: size.width * 0.2,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 3),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                "$partBeforeDecimal% OFF",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: allsize * 0.01,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                "\$${widget.price2}",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: allsize * 0.0115),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                height: size.height * 0.06,
                color: (widget.preorder == "1")
                    ? const Color(0xff9048c4)
                    : (widget.quantity == 0 || widget.quantity! < 0)
                        ? Colors.red
                        : const Color(0xff006ccf),
                child: Center(
                    child: Text(
                  widget.preorder == "1"
                      ? "PRE-ORDER"
                      : (widget.quantity == 0 || widget.quantity! < 0)
                          ? "ADD TO WISH LIST"
                          : "ADD TO CART",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: allsize * 0.012),
                )),
              )
            ],
          ),
        ),
        widget.pulllist == '0'
            ? Container()
            : ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  height: size.height * 0.028,
                  width: size.width * 0.38,
                  color: const Color(0xff006ccf),
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      "Available for pull list!",
                      style: TextStyle(
                          color: Colors.white, fontSize: allsize * 0.011),
                    ),
                  ),
                ),
              )
      ],
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height); // Start from the top-left corner
    path.lineTo(size.width * 0.9, size.height); // Go to the bottom-right corner
    path.lineTo(size.width, 0); // Go to the top-right corner
    path.lineTo(0, 0); // Go back to the top-left corner
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
