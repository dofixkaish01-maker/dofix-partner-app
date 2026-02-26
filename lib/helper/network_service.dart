import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _sub;

  bool _offlineShown = false;

  @override
  void onInit() {
    super.onInit();

    _sub = _connectivity.onConnectivityChanged.listen((results) {
      final hasConnection = results.contains(ConnectivityResult.mobile) ||
          results.contains(ConnectivityResult.wifi) ||
          results.contains(ConnectivityResult.ethernet);

      if (!hasConnection && !_offlineShown) {
        _offlineShown = true;
        _showNoInternet();
      }

      if (hasConnection && _offlineShown) {
        _offlineShown = false;
        _showBackOnline();
      }
    });
  }

  void _showNoInternet() {
    Get.rawSnackbar(
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      duration: const Duration(days: 1),
      messageText: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.red.shade600,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Row(
          children: [
            Icon(Icons.wifi_off, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "No Internet Connection",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
      animationDuration: const Duration(milliseconds: 300),
    );
  }

  void _showBackOnline() {
    if (Get.isSnackbarOpen) Get.closeCurrentSnackbar();

    Get.rawSnackbar(
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      duration: const Duration(seconds: 2),
      messageText: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.green.shade600,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Row(
          children: [
            Icon(Icons.wifi, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "Back Online",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
      animationDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  void onClose() {
    _sub.cancel();
    super.onClose();
  }
}
