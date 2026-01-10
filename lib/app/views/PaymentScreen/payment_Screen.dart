import 'dart:developer';
import 'package:dofix_technichian/utils/theme.dart';
import 'package:dofix_technichian/widgets/common_loading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../../controllers/account_controller.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../utils/app_constants.dart';
import '../../../views/account/account_screen.dart';
import '../../widgets/custom_appbar.dart';
import '../account/profile_screen.dart';

class PaymentScreen extends StatefulWidget {
  final String url;
  final int redirectIndex;
  const PaymentScreen({
    super.key,
    required this.url,
    this.redirectIndex = 0,
  });

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  String? selectedUrl;
  double value = 0.0;
  final bool _isLoading = true;
  PullToRefreshController? pullToRefreshController;
  late MyInAppBrowser browser;

  @override
  void initState() {
    super.initState();
    selectedUrl = widget.url;
    _initData();
    // widget.onPressed;
    log("URL : ${widget.url}");
  }

  void _initData() async {
    browser = MyInAppBrowser(widget.redirectIndex);

    if (GetPlatform.isAndroid) {
      await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);

      bool swAvailable = await WebViewFeature.isFeatureSupported(
          WebViewFeature.SERVICE_WORKER_BASIC_USAGE);
      bool swInterceptAvailable = await WebViewFeature.isFeatureSupported(
          WebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

      if (swAvailable && swInterceptAvailable) {
        ServiceWorkerController serviceWorkerController =
            ServiceWorkerController.instance();
        await serviceWorkerController
            .setServiceWorkerClient(ServiceWorkerClient(
          shouldInterceptRequest: (request) async {
            if (kDebugMode) {
              print(request);
            }
            return null;
          },
        ));
      }
    }

    await browser.openUrlRequest(
      urlRequest: URLRequest(url: WebUri(selectedUrl!)),
      settings: InAppBrowserClassSettings(
        webViewSettings: InAppWebViewSettings(
            useShouldOverrideUrlLoading: true, useOnLoadResource: true),
        browserSettings: InAppBrowserSettings(
            hideUrlBar: true, hideToolbarTop: GetPlatform.isAndroid),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryAppColor,
        appBar: CustomAppBar(
          title: 'Payment'.tr,
          isSearchButtonExist: false,
          isBackButtonExist: true,
        ),
        body: Center(
          child: Stack(
            children: [
              _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          primaryAppColor,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyInAppBrowser extends InAppBrowser {
  final int redirectIndex;
  MyInAppBrowser(this.redirectIndex);

  bool _canRedirect = true;

  @override
  Future onBrowserCreated() async {
    if (kDebugMode) {
      print("\n\nBrowser Created!\n\n");
    }
  }

  @override
  Future onLoadStart(url) async {
    if (kDebugMode) {
      print("\n\nStarted: $url\n\n");
    }
    _pageRedirect(url.toString(), redirectIndex);
  }

  @override
  Future onLoadStop(url) async {
    pullToRefreshController?.endRefreshing();
    if (kDebugMode) {
      print("\n\nStopped: $url\n\n");
    }
    _pageRedirect(url.toString(), redirectIndex);
  }

  @override
  void onLoadError(url, code, message) {
    pullToRefreshController?.endRefreshing();
    if (kDebugMode) {
      print("Can't load [$url] Error: $message");
    }
  }

  @override
  void onProgressChanged(progress) {
    if (progress == 100) {
      pullToRefreshController?.endRefreshing();
    }
    if (kDebugMode) {
      print("Progress: $progress");
    }
  }

  @override
  void onExit() {
    if (_canRedirect) {
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Row(
                children: const [
                  Icon(Icons.error, color: Colors.red),
                  SizedBox(width: 8),
                  Text("Payment Failed"),
                ],
              ),
              content: const Text(
                "Your payment was not completed. Please try again or choose a different payment method.",
                style: TextStyle(fontSize: 14),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Get.back(); // Optionally pop back to previous screen
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        },
      );
    }

    if (kDebugMode) {
      print("\n\nBrowser closed!\n\n");
    }
  }

  @override
  Future<NavigationActionPolicy> shouldOverrideUrlLoading(
      navigationAction) async {
    if (kDebugMode) {
      print("\n\nOverride ${navigationAction.request.url}\n\n");
    }
    return NavigationActionPolicy.ALLOW;
  }

  @override
  void onLoadResource(resource) {}

  @override
  void onConsoleMessage(consoleMessage) {
    if (kDebugMode) {
      print("""
    console output:
      message: ${consoleMessage.message}
      messageLevel: ${consoleMessage.messageLevel.toValue()}
   """);
    }
  }

  void _pageRedirect(
    String url,
    int redirectIndex,
  ) async {
    if (kDebugMode) {
      print("inside_page_redirect");
    }
    log("url:$url");

    // onPressed;

    if (_canRedirect) {
      bool isSuccess =
          url.contains('success') && url.contains(AppConstants.baseUrl);
      bool isFailed =
          url.contains('fail') && url.contains(AppConstants.baseUrl);
      bool isCancel =
          url.contains('cancel') && url.contains(AppConstants.baseUrl);
      log('===============Payment status :: isSuccess: $isSuccess, isFailed: $isFailed, isCancel: $isCancel');
      if (kDebugMode) {
        print('This_called_1::::$url');
      }
      if (isSuccess || isFailed || isCancel) {
        _canRedirect = false;
        close();
        if (isSuccess) {
          log('===============Payment Successful $redirectIndex');
          if (redirectIndex == 1) {
            await Get.find<DashBoardController>().getAccountInfo(true);
            await Get.find<AccountController>().fetchWalletTransactionHistory(
                Get.find<DashBoardController>()
                        .providerDashboardModel
                        .content
                        ?.providerInfo
                        ?.userId ??
                    "");
            Future.delayed(Duration(milliseconds: 100), () {
              Get.snackbar(
                'Success',
                'Wallet Recharge successful',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            });
          } else {
            Get.to(() => AccountScreen());
            Future.delayed(Duration(milliseconds: 100), () {
              Get.snackbar(
                'Success',
                'Subscription purchase successful',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            });
          }
          hideLoading();
        }
      }
    }
  }
}
