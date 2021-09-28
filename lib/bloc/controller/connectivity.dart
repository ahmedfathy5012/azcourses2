import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

class ConnectivityController extends GetxController {
  bool isConnect = false.obs();

  Future<bool> chekConnectivety() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
//    print("hhhhhhhhhh  ${connectivityResult}");
//    if (connectivityResult == ConnectivityResult.mobile ||
//        connectivityResult == ConnectivityResult.wifi) {
//      return true;
//    } else {
//      return false;
//    }
  }
}
