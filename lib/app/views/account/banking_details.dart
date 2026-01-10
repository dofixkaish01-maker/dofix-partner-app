import 'dart:developer';
import 'dart:io';
import 'package:dofix_technichian/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/account_controller.dart';
import '../../../utils/images.dart';
import '../../../utils/sizeboxes.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_update_doc_field.dart';

class BankingDetails extends StatefulWidget {
  const BankingDetails({super.key});

  @override
  State<BankingDetails> createState() => _BankingDetailsState();
}

class _BankingDetailsState extends State<BankingDetails> {
  final AccountController accController = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await accController.fetchBankDetails();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                accController.updateBankDetails();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2297CE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Save Changes',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        appBar: CustomAppBar(
          title: 'Banking Details',
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
        body: SingleChildScrollView(
          child: GetBuilder<AccountController>(
            builder: (accountController) {
              log("Image url is : ${accountController.cancelledChequeImageUrl}");
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      showTitle: true,
                      capitalization: TextCapitalization.words,
                      controller: accountController.accountHolderNameController,
                      hintText: "Account Holder Name",
                      onChanged: (value) {
                        // Get.find<AuthController>().accountHolderName =
                        //     value;
                      },
                      validation: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter account holder name';
                        } else if (!RegExp(r'^[A-Za-z ]+$').hasMatch(value)) {
                          return 'Name can only contain letters and spaces';
                        } else if (value.trim().length < 3) {
                          return 'Name must be at least 3 characters long';
                        }
                        return null;
                      },
                    ),
                    sizedBox20(),

                    CustomTextField(
                      showTitle: true,
                      capitalization: TextCapitalization.words,
                      controller: accountController.accountNumberController,
                      inputType: TextInputType.number,
                      hintText: "Account Number",
                      onChanged: (value) {
                        // Get.find<AuthController>().accountName = value;
                      },
                    ),
                    sizedBox20(),
                    CustomTextField(
                      showTitle: true,
                      capitalization: TextCapitalization.words,
                      controller: accountController.branchNameController,
                      hintText: "Branch Name",
                      onChanged: (value) {
                        // Get.find<AuthController>().accountHolderName =
                        //     value;
                      },
                      validation: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter branch name';
                        } else if (!RegExp(r'^[A-Za-z ]+$').hasMatch(value)) {
                          return 'Name can only contain letters and spaces';
                        } else if (value.trim().length < 3) {
                          return 'Name must be at least 3 characters long';
                        }
                        return null;
                      },
                    ),
                    sizedBox20(),

                    /// Contact Number & Alternate Number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            maxLines: 1,
                            showTitle: true,
                            isPhone: false,
                            hintText: 'IFSC Code',
                            onChanged: (value) {
                              // Get.find<AuthController>().ifscCode = value;
                            },
                            controller: accountController.ifscCodeController,
                          ),
                        ),
                      ],
                    ),
                    sizedBox20(),
                    CustomUpdateDocField(
                      initialImageUrl:
                          accountController.cancelledChequeImageUrl ?? "",
                            
                      onImageSelected: (File image) {
                        accountController.cancelledChaqueImage = image;
                      },
                    ),
                    sizedBox20(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
