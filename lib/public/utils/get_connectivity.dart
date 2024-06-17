import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var isConnected = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkConnectivity();
    _listenConnectivity();
  }

  void _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    isConnected.value = connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile);
  }

  void _listenConnectivity() {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      isConnected.value = result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile);
    });
  }
}
