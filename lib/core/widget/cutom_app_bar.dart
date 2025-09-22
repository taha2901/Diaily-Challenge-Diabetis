
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String? _currentLocale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // التحقق من تغيير اللغة
    final newLocale = context.locale.toString();
    if (_currentLocale != null && _currentLocale != newLocale) {
      if (mounted) {
        setState(() {
          _currentLocale = newLocale;
        });
      }
    } else {
      _currentLocale = newLocale;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.hello_user.tr(),
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              LocaleKeys.how_are_you.tr(),
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.grey[600],
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF3B82F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}