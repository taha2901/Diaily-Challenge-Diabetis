import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class LanguageAwareWidget extends StatefulWidget {
  final Widget Function() builder;
  final String? debugName;

  const LanguageAwareWidget({
    super.key,
    required this.builder,
    this.debugName,
  });

  @override
  State<LanguageAwareWidget> createState() => _LanguageAwareWidgetState();
}

class _LanguageAwareWidgetState extends State<LanguageAwareWidget> {
  String? _currentLocale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
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
    return widget.builder();
  }
}