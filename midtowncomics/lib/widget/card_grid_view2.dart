
import 'package:midtowncomics/export.dart';

class CardGridView2 extends StatelessWidget {
  const CardGridView2({super.key});

  @override
  Widget build(BuildContext context) {
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Consumer<StreamedDataProvider>(builder: (context, provider, child) {
      return Padding(
        padding: EdgeInsets.only(left: allsize * 0.005, right: allsize * 0.005),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisSpacing: allsize * 0.01,
          mainAxisSpacing: allsize * 0.01,
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.shortestSide < 550
              ? (2 / 3.5)
              : (2 / 2.2),
          children: [
            //New to Mid tOWN
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(allsize * 0.01),
                  child:provider.featurenewreleasegrid.isEmpty?const Center(child: CircularProgressIndicator(),):
                  Column(
                    children: [
                      Text(
                        "Action Figures",
                        style: TextStyle(
                            color: const Color(0xff1569b4),
                            fontSize: allsize * 0.016,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Flexible(
                        child: Image.network(
                          "https://www.midtowncomics.com/images/PRODUCT/FUL/${provider.featurenewrelease1['pr_id']}_ful.jpg",
                          fit: BoxFit.contain,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //New Release
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(allsize * 0.01),
                  child:
                      provider.featurenewrelease2.isEmpty?const Center(child: CircularProgressIndicator(),):
                  Column(
                    children: [
                      Text(
                        "Japanese Import",
                        style: TextStyle(
                            color: const Color(0xff1569b4),
                            fontSize: allsize * 0.016,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Flexible(
                        child: Image.network(
                          "https://www.midtowncomics.com/images/PRODUCT/FUL/${provider.streamedData['DATA']['featureNewAdditionSection2']['pr_id']}_ful.jpg",
                          fit: BoxFit.contain,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //My Pull List
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(allsize * 0.01),
                  child:
                      provider.featurenewrelease2.isEmpty?const Center(child: CircularProgressIndicator(),):
                  Column(
                    children: [
                      Text(
                        "Funko",
                        style: TextStyle(
                            color: const Color(0xff1569b4),
                            fontSize: allsize * 0.016,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Flexible(
                        child: Image.network(
                          "https://www.midtowncomics.com/images/PRODUCT/FUL/${provider.streamedData['DATA']['featureNewAdditionSection3']['pr_id']}_ful.jpg",
                          fit: BoxFit.contain,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Pre Order
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(allsize * 0.01),
                  child:
                      provider.featurenewrelease4.isEmpty?const Center(child:CircularProgressIndicator(),):
                  Column(
                    children: [
                      Text(
                        "Apparel",
                        style: TextStyle(
                            color: const Color(0xff1569b4),
                            fontSize: allsize * 0.016,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Flexible(
                        child: Image.network(
                          "https://www.midtowncomics.com/images/PRODUCT/FUL/${provider.streamedData['DATA']['featureNewAdditionSection4']['pr_id']}_ful.jpg",
                          fit: BoxFit.contain,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
