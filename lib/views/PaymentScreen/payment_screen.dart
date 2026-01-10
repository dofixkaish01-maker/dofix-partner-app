import 'package:dofix_technichian/app/views/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/widgets/custom_appbar.dart';
import '../../utils/app_constants.dart';
import '../../utils/dimensions.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../widgets/custom_snack_bar.dart';
import '../../widgets/payment_failed_dialog.dart';

class PaymentScreen extends StatefulWidget {
  final String url;
  final String fromPage;

  const PaymentScreen({
    super.key,
    required this.url,
    required this.fromPage,
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
    _loadTrialWidgetShow();
  }

  Future<void> _loadTrialWidgetShow() async {
    // await Get.find<UserProfileController>().trialWidgetShow(route: RouteHelper.businessPlan);
  }

  void _initData() async {
    browser = MyInAppBrowser(fromPage: widget.fromPage, mainUrl: widget.url);

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
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        // Get.find<UserProfileController>().trialWidgetShow(route: '');
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: CustomAppBar(
          title: 'Payment'.tr,
        ),
        body: Center(
          child: Stack(
            children: [
              _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).colorScheme.primary)),
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
  final String fromPage;
  final String mainUrl;

  MyInAppBrowser({required this.fromPage, required this.mainUrl});

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
    _pageRedirect(url.toString());
  }

  @override
  Future onLoadStop(url) async {
    pullToRefreshController?.endRefreshing();
    if (kDebugMode) {
      print("\n\nStopped: $url\n\n");
    }
    _pageRedirect(url.toString());
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
          return const PopScope(
            canPop: true,
            child: AlertDialog(
              contentPadding: EdgeInsets.all(Dimensions.paddingSize12),
              content: PaymentFailedDialog(),
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
  void onConsoleMessage(consoleMessage) {}

  void _pageRedirect(String url) async {
    bool isSuccess =
        url.contains('success') && url.contains(AppConstants.baseUrl);
    bool isFailed = url.contains('fail') && url.contains(AppConstants.baseUrl);
    bool isCancel =
        url.contains('cancel') && url.contains(AppConstants.baseUrl);

    if (_canRedirect) {
      if (isSuccess || isFailed || isCancel) {
        _canRedirect = false;
        close();
      }

      if (isSuccess) {
        close();
        showCustomSnackBar('Paid Successfully'.tr, isSuccess: true);
        Get.offAll(() => DashboardScreen(pageIndex: 0));
      }
    } else if (isFailed || isCancel) {
      close();
      Get.back();
      Get.offAll(() => DashboardScreen(pageIndex: 0));
      showCustomSnackBar('Transaction Failed'.tr);
    }
  }
}
