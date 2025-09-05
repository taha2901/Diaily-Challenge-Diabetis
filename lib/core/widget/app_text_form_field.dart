import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UniversalFormField extends StatefulWidget {
  final String? hintText;
  final String? suffixText;
  final String? prefixText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final void Function(String)? onFieldSubmitted;
  final VoidCallback? onTap;
  final TextAlign textAlign;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final bool isObscureText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Color? backgroundColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final bool enabled;

  // Dropdown Properties
  final bool hasDropdown;
  final List<String>? dropdownItems;
  final String? initialDropdownValue;
  final Function(String?)? onDropdownChanged;
  final Function(String?)? mealname;

  const UniversalFormField({
    super.key,
    this.hintText,
    this.suffixText,
    this.prefixText,
    this.controller,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.hintStyle,
    this.inputTextStyle,
    this.isObscureText = false,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.backgroundColor,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.enabled = true,
    // Dropdown
    this.hasDropdown = false,
    this.dropdownItems,
    this.initialDropdownValue,
    this.onDropdownChanged,
    this.mealname,
  });

  @override
  State<UniversalFormField> createState() => _UniversalFormFieldState();
}

class _UniversalFormFieldState extends State<UniversalFormField> {
  String? selectedDropdownValue;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    selectedDropdownValue = widget.initialDropdownValue;
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    // إذا كان dropdown، نرجع widget مختلف
    if (widget.hasDropdown) {
      return _buildDropdownField();
    }

    return _buildTextFormField();
  }

  Widget _buildTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          if (_isFocused)
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        onTap: widget.onTap,
        validator: widget.validator,
        obscureText: widget.isObscureText,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        textAlign: widget.textAlign,
        readOnly: widget.readOnly,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        enabled: widget.enabled,
        style: widget.inputTextStyle ?? TextStyle(
          fontSize: 16.sp,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ?? TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[500],
          ),
          suffixText: widget.suffixText,
          prefixText: widget.prefixText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          filled: true,
          fillColor: widget.backgroundColor ?? 
            (_isFocused ? Colors.blue.withOpacity(0.05) : Colors.grey[50]),
          contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: widget.enabledBorder ?? OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: Colors.grey[300]!,
              width: 1,
            ),
          ),
          focusedBorder: widget.focusedBorder ?? OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: widget.backgroundColor ?? Colors.grey[50],
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: DropdownButtonFormField<String>(
        value: selectedDropdownValue,
        decoration: InputDecoration(
          hintText: widget.hintText ?? 'اختر من القائمة',
          hintStyle: widget.hintStyle ?? TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[500],
          ),
          prefixIcon: widget.prefixIcon,
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
        ),
        style: widget.inputTextStyle ?? TextStyle(
          fontSize: 16.sp,
          color: Colors.black87,
        ),
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey[600],
        ),
        isExpanded: true,
        validator: widget.validator,
        items: widget.dropdownItems?.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
        onChanged: widget.enabled ? (String? value) {
          setState(() {
            selectedDropdownValue = value;
          });
          
          // استدعاء الcallbacks
          if (widget.onDropdownChanged != null) {
            widget.onDropdownChanged!(value);
          }
          if (widget.mealname != null) {
            widget.mealname!(value);
          }
          if (widget.onChanged != null && value != null) {
            widget.onChanged!(value);
          }
          
          // تحديث controller إذا كان موجود
          if (widget.controller != null) {
            widget.controller!.text = value ?? '';
          }
        } : null,
      ),
    );
  }
}