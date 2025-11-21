import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Top tabs count
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 18,
          ),
          title: const Text(
            "Activity",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.black,
            dividerColor: Colors.transparent,
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(color: Colors.transparent),
            tabs: [
              Tab(text: "04.08 - 10.08"),
              Tab(text: "Current Week"),
              Tab(text: "Past 3 Months"),
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            // Rides Count
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF002F6C),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "40 Rides",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Chart
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    minY: 0,
                    maxY: 30,
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: 5,
                      checkToShowHorizontalLine: (value) => value % 5 == 0,
                      getDrawingHorizontalLine: (value) =>
                          FlLine(color: Colors.grey.shade300, strokeWidth: 1),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                        top: BorderSide(color: Colors.grey.shade300, width: 1),
                      ),
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 20,
                          interval: 5,
                          getTitlesWidget: (value, meta) => Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                            return Text(
                              days[value.toInt()],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    barGroups: [
                      bar(0, 5, true),
                      bar(1, 10, true),
                      bar(2, 26, true),
                      bar(3, 8, false),
                      bar(4, 11, false),
                      bar(5, 4, false),
                      bar(6, 6, false),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom Tabs
            Container(
              height: 65,
              decoration: const BoxDecoration(color: AppColors.inputboxcolor),
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                  labelColor: Colors.black,
                  indicator: BoxDecoration(color: Colors.transparent),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.transparent,
                  tabs: [
                    Tab(child: navItem("Hours", false)),
                    Tab(child: navItem("Rides", true)),
                    Tab(child: navItem("Cancels", false)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData bar(int x, double y, bool active) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 22,

          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
          color: active ? const Color(0xFF002F6C) : Colors.grey.shade300,
        ),
      ],
    );
  }

  Widget navItem(String text, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: active ? AppColors.white : AppColors.inputboxcolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
