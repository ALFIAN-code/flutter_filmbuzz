import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var isConnected = false.obs;

  @override
  void onInit() {
    super.onInit();
    // _checkConnectivity();
    _listenConnectivity();
  }

  // void _checkConnectivity() async {
  //   var connectivityResult = await Connectivity().checkConnectivity();
  //   if (connectivityResult == ConnectivityResult.none) {
  //     isConnected.value = false;
  //   } else {
  //     isConnected.value = await _hasInternetAccess();
  //   }
  // }

  void _listenConnectivity() {
    Connectivity().onConnectivityChanged.listen(( result) async {
      if (result.isEmpty) {
        isConnected.value = false;
      } else {
        isConnected.value = await _hasInternetAccess();
      }
    },
    );
  }

  Future<bool> _hasInternetAccess() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } catch (e) {
      // Failed to lookup google.com
    }
    return false;
  }
}