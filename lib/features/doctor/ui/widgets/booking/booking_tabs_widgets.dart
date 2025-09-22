import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
        tabs: [
          Tab(child: Text(LocaleKeys.booking_tab_data.tr(), style: const TextStyle(fontSize: 12))),
          Tab(child: Text(LocaleKeys.booking_tab_date.tr(), style: const TextStyle(fontSize: 12))),
          Tab(child: Text(LocaleKeys.booking_tab_notes.tr(), style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }
}
