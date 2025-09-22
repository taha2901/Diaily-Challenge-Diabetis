import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String message;
  final VoidCallback? onRefresh;

  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.message,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.primaryColor.withOpacity(0.1),
                    theme.primaryColor.withOpacity(0.05),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: theme.primaryColor.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Icon(
                icon,
                size: 48.sp,
                color: theme.primaryColor.withOpacity(0.7),
              ),
            ),
            
            const SizedBox(height: 24),
            
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isDark 
                  ? Colors.grey[300] 
                  : Colors.grey[600],
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
            
            const SizedBox(height: 8),
            
            
            if (onRefresh != null) ...[
              const SizedBox(height: 32),
              
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [
                      theme.primaryColor,
                      theme.primaryColor.withOpacity(0.8),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: theme.primaryColor.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: onRefresh,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.refresh_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        LocaleKeys.Update.tr(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}