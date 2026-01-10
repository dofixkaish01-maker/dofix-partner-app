import 'package:dofix_technichian/app/widgets/custom_appbar.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../app/widgets/comment_item_widget.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) {
        final reviews = controller.reviewResponse.content?.reviews.data;

        return Scaffold(
          appBar: CustomAppBar(
            title: "Reviews",
            isBackButtonExist: true,
            isSearchButtonExist: false,
          ),
          body: (reviews == null || reviews.isEmpty)
              ? const Center(child: Text("No Reviews"))
              : ListView.builder(
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    final review = reviews[index];
                    final customer = review.customer;
                    "${customer?.firstName ?? "Unknown"} ${customer?.lastName ?? ""}"
                        .trim();
                    String imageUrl =
                        '${AppConstants.imgProfileBaseUrl}${review.customer?.profileImage}';
                    String formattedDate = "";
                    final parsedDate = DateTime.tryParse(review.createdAt);
                    if (parsedDate != null) {
                      formattedDate =
                          DateFormat('dd-MM-yyyy').format(parsedDate);
                    }

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommentItemWidget(
                        rating: review.reviewRating.toString(),
                        userName: review.customer?.firstName ?? "Unknown",
                        date: formattedDate,
                        comment: review.reviewComment,
                        imageUrl: imageUrl,
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
