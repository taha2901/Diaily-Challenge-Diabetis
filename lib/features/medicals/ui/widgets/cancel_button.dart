import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: OutlinedButton(
        onPressed: () => Navigator.pop(context),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey[300]!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          LocaleKeys.cancel.tr(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
