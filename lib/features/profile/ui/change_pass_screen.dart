import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/widget/app_text_form_field.dart';
import 'package:challenge_diabetes/core/widget/app_text_button.dart';
import 'package:challenge_diabetes/core/widget/cutom_app_bar.dart';
import 'package:challenge_diabetes/features/profile/logic/profile_cubit.dart';
import 'package:challenge_diabetes/features/profile/logic/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // state.whenOrNull(
        //   changePasswordSuccess: (message) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(
        //         content: Text(message),
        //         backgroundColor: Colors.green,
        //       ),
        //     );
        //     Navigator.pop(context);
        //   },
        //   changePasswordError: (error) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(
        //         content: Text(error.getAllErrorMessages()),
        //         backgroundColor: Colors.red,
        //       ),
        //     );
        //   },
        // );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsManager.mainBackGround,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(
                      'Change Password',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(10),
                    
                    Text(
                      'Please enter your current password and a new secure password',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    verticalSpace(30),

                    // Current Password Field
                    UniversalFormField(
                      controller: _currentPasswordController,
                      hintText: 'Current Password',
                      isObscureText: !_isCurrentPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isCurrentPasswordVisible ? Iconsax.eye : Iconsax.eye_slash,
                        ),
                        onPressed: () {
                          setState(() {
                            _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                          });
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your current password';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(20),

                    // New Password Field
                    UniversalFormField(
                      controller: _newPasswordController,
                      hintText: 'New Password',
                      isObscureText: !_isNewPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isNewPasswordVisible ? Iconsax.eye : Iconsax.eye_slash,
                        ),
                        onPressed: () {
                          setState(() {
                            _isNewPasswordVisible = !_isNewPasswordVisible;
                          });
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a new password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(20),

                    // Confirm New Password Field
                    UniversalFormField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm New Password',
                      isObscureText: !_isConfirmPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible ? Iconsax.eye : Iconsax.eye_slash,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your new password';
                        }
                        if (value != _newPasswordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(40),

                    // Change Password Button
                    // state.maybeWhen(
                    //   changePasswordLoading: () => const Center(
                    //     child: CircularProgressIndicator(),
                    //   ),
                    //   orElse: () => AppTextButton(
                    //     buttonText: 'Change Password',
                    //     textStyle: const TextStyle(
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //     onPressed: () {
                    //       if (_formKey.currentState!.validate()) {
                    //         ProfileCubit.get(context).changePassword(
                    //           _currentPasswordController.text,
                    //           _newPasswordController.text,
                    //         );
                    //       }
                    //     },
                    //   ),
                    // ),

                    AppTextButton(
                        buttonText: 'Change Password',
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        onPressed: () {
                         
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}