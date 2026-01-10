import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/date_converter.dart';
import '../../utils/dimensions.dart';
import '../../views/widgets/graph_custom_button.dart';
import '../../widgets/custom_drop_down.dart';

enum EarningType { monthly, yearly }

class WalletBalanceChart extends StatefulWidget {
  @override
  State<WalletBalanceChart> createState() => _WalletBalanceChartState();
}

class _WalletBalanceChartState extends State<WalletBalanceChart> {
  String selectedValue = "Is mahine ki kamai";

  // Default value
  final List<String> items = [
    "Is mahine ki kamai",
    "Last Month",
    "This Year",
    "Custom Range"
  ];

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );

    int interval = Get.find<DashBoardController>().monthlyChartList.length == 31
        ? 2
        : Get.find<DashBoardController>().monthlyChartList.length == 30
            ? 2
            : 2;

    if (value % interval != 0) {
      // If not matching interval, return empty
      return const SizedBox.shrink();
    }

    return SideTitleWidget(
      meta: meta,
      space: 10.0,
      child: Text(
        '${value.toInt() == 0 ? 1 : value.toInt()}',
        style: style,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<DashBoardController>().getMonthlyBookingsDataForChart(
        DateConverter.stringYear(DateTime.now()),
        DateTime.now().month.toString());
  }

  @override
  Widget build(BuildContext context) {
    List<String> previousYearsList = [];
    for (int i = 0; i <= 4; i++) {
      previousYearsList.add((DateTime.now().year - i).toString());
    }

    return GetBuilder<DashBoardController>(builder: (controller) {
      debugPrint("=== CHART DEBUG ===");
      debugPrint("Chart Type: ${controller.getChartType}");
      debugPrint(
          "Monthly Chart List Length: ${controller.monthlyChartList.length}");
      debugPrint("Monthly Chart List: ${controller.monthlyChartList}");
      debugPrint(
          "Yearly Chart List Length: ${controller.yearlyChartList.length}");
      debugPrint("Yearly Chart List: ${controller.yearlyChartList}");
      debugPrint("Monthly Stats List: ${controller.mStatsList}");
      debugPrint("==================");
      return Container(
        height: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xfff207FA8), // Background color
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<DashBoardController>(
              builder: (dashboardController) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        dashboardController.getMonthlyBookingsDataForChart(
                            DateConverter.stringYear(DateTime.now()),
                            DateTime.now().month.toString());
                        dashboardController.changeGraph(EarningType.monthly);
                      },
                      child: GraphCustomButton(
                          buttonText: "Monthly",
                          isSelectedButton: dashboardController.getChartType ==
                                  EarningType.monthly
                              ? true
                              : false),
                    ),
                    const SizedBox(width: Dimensions.paddingSizeDefault),
                    GestureDetector(
                      onTap: () {
                        dashboardController.getYearlyBookingsDataForChart(
                            DateConverter.stringYear(DateTime.now()));
                        dashboardController.changeGraph(EarningType.yearly);
                      },
                      child: GraphCustomButton(
                          buttonText: "Yearly",
                          isSelectedButton: dashboardController.getChartType ==
                                  EarningType.yearly
                              ? true
                              : false),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            GetBuilder<DashBoardController>(
              builder: (dashboardController) {
                return dashboardController.getChartType == EarningType.monthly
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomDropDownButton(
                            title: "Year",
                            type: "Year",
                            itemList: previousYearsList,
                          ),
                          const SizedBox(width: Dimensions.paddingSizeDefault),
                          CustomDropDownButton(
                            title: "Month",
                            type: "Month",
                            itemList: const [
                              'january',
                              'february',
                              'march',
                              'april',
                              'may',
                              'june',
                              'july',
                              'august',
                              'september',
                              'october',
                              'november',
                              'december',
                            ],
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomDropDownButton(
                              title: "Year",
                              type: "Year",
                              itemList: previousYearsList),
                        ],
                      );
              },
            ),
            GetBuilder<DashBoardController>(builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Wallet Earning",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '₹ ${controller.providerDashboardModel.content?.providerInfo?.owner?.account?.receivedBalance ?? 0}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  // Expanded(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.end,
                  //     children: [
                  //       // DropdownButtonHideUnderline(
                  //       //   child: DropdownButton<String>(
                  //       //     isDense: true,
                  //       //     elevation: 0,
                  //       //     padding: EdgeInsets.zero,
                  //       //     dropdownColor: Colors.black,
                  //       //     icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  //       //     value: selectedValue,
                  //       //     onChanged: (newValue) {
                  //       //       setState(() {
                  //       //         selectedValue = newValue!;
                  //       //       });
                  //       //     },
                  //       //     items: items.map<DropdownMenuItem<String>>((String value) {
                  //       //       return DropdownMenuItem<String>(
                  //       //         value: value,
                  //       //         child: Text(
                  //       //           value,
                  //       //           style: const TextStyle(color: Colors.white, fontSize: 12),
                  //       //         ),
                  //       //       );
                  //       //     }).toList(),
                  //       //   ),
                  //       // ),
                  //       //
                  //       // Container(
                  //       //   decoration: BoxDecoration(
                  //       //     color: Colors.white,
                  //       //     borderRadius: BorderRadius.circular(8),
                  //       //   ),
                  //       //   child: ElevatedButton(
                  //       //     onPressed: () {},
                  //       //     style: ElevatedButton.styleFrom(
                  //       //       elevation: 0,
                  //       //       backgroundColor: Colors.transparent,
                  //       //       foregroundColor: Colors.blue,
                  //       //       padding: const EdgeInsets.symmetric(
                  //       //           horizontal: 35, vertical: 6),
                  //       //     ),
                  //       //     child: const Text("Top up"),
                  //       //   ),
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                ],
              );
            }),
            const SizedBox(height: 16),
            Expanded(
              child: controller.getChartType == EarningType.monthly
                  ? controller.monthlyChartList.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.bar_chart,
                                  color: Colors.white54, size: 48),
                              SizedBox(height: 8),
                              Text(
                                "No monthly data available",
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      : BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            barTouchData: BarTouchData(
                              touchTooltipData: BarTouchTooltipData(
                                getTooltipItem:
                                    (group, groupIndex, rod, rodIndex) {
                                  return BarTooltipItem(
                                    '${controller.getChartType == EarningType.monthly ? controller.selectedMonth : controller.selectedYear} ${controller.getChartType == EarningType.monthly ? group.x.toInt() : controller.monthMap2[group.x.toInt() == 12 ? 11 : group.x.toInt()]}\n',
                                    const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Amount: ${rod.toY}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            barGroups: controller.monthlyChartList,
                            borderData: FlBorderData(show: false),
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 32,
                                  interval: 1,
                                  getTitlesWidget: bottomTitleWidgets,
                                ),
                              ),
                            ),
                          ),
                        )
                  : controller.yearlyChartList.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.bar_chart,
                                  color: Colors.white54, size: 48),
                              SizedBox(height: 8),
                              Text(
                                "No yearly data available",
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      : BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            barTouchData: BarTouchData(
                              touchTooltipData: BarTouchTooltipData(
                                getTooltipItem:
                                    (group, groupIndex, rod, rodIndex) {
                                  return BarTooltipItem(
                                    '${controller.getChartType == EarningType.monthly ? controller.selectedMonth : controller.selectedYear} ${controller.getChartType == EarningType.monthly ? group.x.toInt() : controller.monthMap2[group.x.toInt() == 12 ? 11 : group.x.toInt()]}\n',
                                    const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Amount: ${rod.toY}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            barGroups: controller.yearlyChartList,
                            borderData: FlBorderData(show: false),
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 32,
                                  interval: 1,
                                  getTitlesWidget: (value, meta) {
                                    List<String> monthList = [
                                      "Jan",
                                      "Feb",
                                      "Mar",
                                      "Apr",
                                      "May",
                                      "Jun",
                                      "Jul",
                                      "Aug",
                                      "Sep",
                                      "Oct",
                                      "Nov",
                                      "Dec"
                                    ];
                                    // debugPrint("monthList: ${monthList[value.toInt() - 1]}");
                                    debugPrint("monthList: ${value.toInt()}");
                                    return Text(
                                      "${controller.monthMap2[value.toInt() == 12 ? 11 : value.toInt()]}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
            ),
          ],
        ),
      );
    });
  }
}

// class CustomDropdownExample extends StatefulWidget {
//   @override
//   _CustomDropdownExampleState createState() => _CustomDropdownExampleState();
// }
//
// class _CustomDropdownExampleState extends State<CustomDropdownExample> {
//   String selectedValue = "This Month"; // Default value
//
//   final List<String> items = [
//     "This Month",
//     "Last Month",
//     "This Year",
//     "Custom Range"
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       elevation: 0,
//       padding: EdgeInsets.zero,
//       dropdownColor: Colors.black,
//       icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
//       value: selectedValue,
//       onChanged: (newValue) {
//         setState(() {
//           selectedValue = newValue!;
//         });
//       },
//       items: items.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(
//             value,
//             style: const TextStyle(color: Colors.white, fontSize: 12),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
