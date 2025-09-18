
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/networking/api_error_model.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorErrorRetryWidget extends StatelessWidget {
  final ApiErrorModel error ;
  const DoctorErrorRetryWidget({
    super.key, required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red[400],
          ),
          const SizedBox(height: 16),
          Text(
            'حدث خطأ في تحميل البيانات',
            style: TextStyle(
              fontSize: 18,
              color: Colors.red[600],
            ),
          ),
          verticalSpace(8),
          Text(
            error.title ?? 'خطأ غير معروف',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<DoctorsCubit>().getDoctors();
            },
            child: const Text('إعادة المحاولة'),
          ),
        ],
      ),
    );
  }
}
