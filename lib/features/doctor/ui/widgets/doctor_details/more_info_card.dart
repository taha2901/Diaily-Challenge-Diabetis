import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModernInfoItem {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final bool isClickable;
  final VoidCallback? onTap;

  ModernInfoItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.isClickable = false,
    this.onTap,
  });
}

class ModernInfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<ModernInfoItem> items;
  final Gradient gradient;

  const ModernInfoCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.items,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 25,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          // Header with gradient
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 22.sp,
                  ),
                ),
                
                SizedBox(width: 12.w),
                
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Content
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                
                return Column(
                  children: [
                    _buildInfoRow(item),
                    if (index < items.length - 1) ...[
                      SizedBox(height: 16.h),
                      Divider(
                        color: const Color(0xFFF1F5F9),
                        thickness: 1,
                        height: 1,
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(ModernInfoItem item) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        padding: item.isClickable 
            ? EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h)
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: item.isClickable 
              ? item.color.withOpacity(0.05)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: item.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                item.icon,
                color: item.color,
                size: 20.sp,
              ),
            ),
            
            SizedBox(width: 16.w),
            
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF64748B),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
                  ),
                  
                  SizedBox(height: 4.h),
                  
                  Text(
                    item.value,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xFF1E293B),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                    ),
                  ),
                ],
              ),
            ),
            
            // Action indicator
            if (item.isClickable) ...[
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: item.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.phone_rounded,
                  color: item.color,
                  size: 16.sp,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}