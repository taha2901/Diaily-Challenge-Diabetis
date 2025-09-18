import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:flutter/material.dart';

class BookingTabsWidget extends StatelessWidget {
  final TabController tabController;

  const BookingTabsWidget({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: tabController,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey[600],
        indicator: BoxDecoration(
          color: ColorsManager.mainBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const [
          Tab(child: Text('البيانات', style: TextStyle(fontSize: 12))),
          Tab(child: Text('التاريخ', style: TextStyle(fontSize: 12))),
          Tab(child: Text('الوقت', style: TextStyle(fontSize: 12))),
          Tab(child: Text('ملاحظات', style: TextStyle(fontSize: 12))),
        ],
      ),
    );
  }
}