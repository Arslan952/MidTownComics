

import '../export.dart';

class AddressProvider extends ChangeNotifier {

  bool indicator=false;
  changeindicator(bool data)
  {
    indicator=data;
    notifyListeners();
  }

  Map<String,dynamic> Addressalldata={};
  List<dynamic>address=[];

  LoadAddressData(Map<String,dynamic>data)
  {
    Addressalldata=data;
    print(data['DATA']['addressList']);
    address=data['DATA']['addressList'];
    notifyListeners();
  }

}