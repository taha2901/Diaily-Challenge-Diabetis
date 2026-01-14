import 'dart:io';
import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/helpers/shared_pref_helper.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String userName = '';
  String userPhoto = '';
  String? _currentLocale;

  @override
  void initState() {
    super.initState();
    loadUserData(); // تغيير الاسم لتحميل كل البيانات
  }

  Future<void> loadUserData() async {
    // تحميل اسم المستخدم
    final name = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userName,
    );
    
    // تحميل صورة المستخدم
    final photo = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userPhoto,
    );

    if (mounted) {
      setState(() {
        // تعيين اسم المستخدم
        if (name != null && name.isNotEmpty) {
          userName = name;
        } else {
          userName = 'User';
        }
        
        // تعيين صورة المستخدم
        if (photo != null && photo.isNotEmpty) {
          userPhoto = photo;
        }
      });
    }
  }

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

  // Widget لعرض صورة المستخدم
  Widget _buildUserAvatar() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF3B82F6),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: _buildImageWidget(),
      ),
    );
  }

  // Widget لبناء الصورة حسب نوعها (محلية أو من الإنترنت)
  Widget _buildImageWidget() {
    if (userPhoto.isEmpty) {
      // صورة افتراضية
      return const Icon(
        Icons.person,
        color: Colors.white,
        size: 20,
      );
    }

    // التحقق من نوع الصورة
    if (userPhoto.startsWith('http') || userPhoto.startsWith('https')) {
      // صورة من الإنترنت
      return Image.network(
        userPhoto,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // في حالة فشل تحميل الصورة
          return const Icon(
            Icons.person,
            color: Colors.white,
            size: 20,
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
        },
      );
    } else {
      // صورة محلية
      final file = File(userPhoto);
      if (file.existsSync()) {
        return Image.file(
          file,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.person,
              color: Colors.white,
              size: 20,
            );
          },
        );
      } else {
        // الملف غير موجود
        return const Icon(
          Icons.person,
          color: Colors.white,
          size: 20,
        );
      }
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
              '${LocaleKeys.hello_userr.tr()} $userName',
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
        const Spacer(),
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
            _buildUserAvatar(), // استخدام Widget الصورة الجديد
          ],
        ),
      ],
    );
  }
}