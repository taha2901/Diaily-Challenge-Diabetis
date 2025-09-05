import 'dart:io';
import 'package:challenge_diabetes/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:challenge_diabetes/features/signup/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePhotoPicker extends StatelessWidget {
  const ProfilePhotoPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => 
          current is ImageSelected || 
          current is RegisterLoading ||
          current is RegisterError || 
          current is RegisterSuccess ,
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        
        return Column(
          children: [
            Text(
              'Profile Photo',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 12.h),
            
            GestureDetector(
              onTap: () => _showPhotoOptions(context),
              child: Container(
                width: 120.w,
                height: 120.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: cubit.pickedImage != null
                    ? _buildSelectedImage(cubit.pickedImage!.path)
                    : _buildPlaceholder(),
              ),
            ),
            SizedBox(height: 8.h),
            
            Text(
              cubit.pickedImage != null 
                  ? 'Tap to change photo' 
                  : 'Tap to select photo',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey[600],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSelectedImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60.r),
      child: Image.file(
        File(imagePath),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholder();
        },
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[100],
      ),
      child: Icon(
        Icons.add_a_photo_outlined,
        size: 40.r,
        color: Colors.grey[400],
      ),
    );
  }

  void _showPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 20.h),
            
            Text(
              'Select Photo',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            
            _buildOptionTile(
              context,
              icon: Icons.camera_alt_outlined,
              title: 'Take Photo',
              onTap: () {
                Navigator.pop(context);
                context.read<RegisterCubit>().pickImageFromCamera();
              },
            ),
            
            _buildOptionTile(
              context,
              icon: Icons.photo_library_outlined,
              title: 'Choose from Gallery',
              onTap: () {
                Navigator.pop(context);
                context.read<RegisterCubit>().pickImageFromGallery();
              },
            ),
            
            if (context.read<RegisterCubit>().pickedImage != null)
              _buildOptionTile(
                context,
                icon: Icons.delete_outline,
                title: 'Remove Photo',
                onTap: () {
                  Navigator.pop(context);
                  context.read<RegisterCubit>().removeImage();
                },
                isDestructive: true,
              ),
            
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive ? Colors.red : Colors.blue,
        size: 24.r,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          color: isDestructive ? Colors.red : Colors.black87,
        ),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      tileColor: Colors.grey[50],
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
    );
  }
}