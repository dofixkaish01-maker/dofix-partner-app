import 'dart:developer';

import 'package:dofix_technichian/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/account_controller.dart';
import '../../../model/account/provider_review_model.dart';
import '../../../utils/images.dart';
import '../../widgets/comment_item_widget.dart';
import '../../widgets/custom_appbar.dart';

class ReviewRatingsScreen extends StatefulWidget {
  const ReviewRatingsScreen({super.key});

  @override
  State<ReviewRatingsScreen> createState() => _ReviewRatingsScreenState();
}

class _ReviewRatingsScreenState extends State<ReviewRatingsScreen> {
  final accountController = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Ratings aur Reviews',
          isSearchButtonExist: false,
          isBackButtonExist: true,
          isTitleExist: false,
          drawerButton: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(
              Images.iclogo,
              height: 70,
              width: 70,
            ),
          ),
        ),
        body: accountController.providerReviews != null &&
                accountController.providerReviews!.isNotEmpty
            ? ListView.builder(
                itemCount: accountController.providerReviews?.length,
                itemBuilder: (context, index) {
                  ProviderReview? review =
                      accountController.providerReviews?[index];
                  String formattedDate = review?.createdAt != null
                      ? DateFormat('dd-MM-yyyy').format(review!.createdAt!)
                      : "";
                  String imageUrl =
                      '${AppConstants.imgProfileBaseUrl}${review?.customer?.profileImage}';
                  log("Image URL: $imageUrl");
                  return CommentItemWidget(
                    rating: review?.reviewRating?.toString(),
                    userName: review?.customer?.firstName ?? "Unknown",
                    date: formattedDate,
                    comment: review?.reviewComment ?? "No comment provided",
                    imageUrl: imageUrl,
                  );
                },
              )
            : Container(
                alignment: Alignment.center,
                child: Text(
                  "No reviews available",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
      ),
    );
  }
}
