import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/theming/styles.dart';
import 'package:challenge_diabetes/features/sports/data/model/exercise_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;

  const ExerciseCard({
    super.key,
    required this.exercise,
  });

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(exercise.moreInfoUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            /// ✅ صورة التمرين
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                exercise.photo,
                height: 70.h,
                width: 70.w,
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpace(12),

            /// ✅ الوصف
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise.name,
                    style: TextStyles.font15DarkBlueMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(4),
                  Text(
                    exercise.description,
                    style: TextStyles.font12GrayMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            /// ✅ زر "عرض"
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: CircleAvatar(
                backgroundColor: ColorsManager.mainBlue,
                radius: 22.r,
                child: Icon(Icons.open_in_new, color: Colors.white, size: 20.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
