import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';

class ContactDialog extends StatelessWidget {
  final String title;
  final String content;
  final String type;

  const ContactDialog({
    super.key,
    required this.title,
    required this.content,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              type == 'phone' ? Icons.phone : Icons.email,
              color: ColorsManager.mainBlue,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('إلغاء'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: content));
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'تم نسخ ${type == 'phone' ? 'رقم الهاتف' : 'البريد الإلكتروني'}',
                          ),
                          duration: const Duration(seconds: 2),
                          backgroundColor: ColorsManager.mainBlue,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.mainBlue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('نسخ'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
