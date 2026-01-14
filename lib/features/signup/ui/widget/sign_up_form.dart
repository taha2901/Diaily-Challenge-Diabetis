import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/widget/app_text_form_field.dart';
import 'package:challenge_diabetes/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterFormFields extends StatefulWidget {
  const RegisterFormFields({super.key});

  @override
  State<RegisterFormFields> createState() => _RegisterFormFieldsState();
}

class _RegisterFormFieldsState extends State<RegisterFormFields> {
  bool isPasswordHidden = true;
  late RegisterCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<RegisterCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Full Name
        UniversalFormField(
          hintText: 'Full Name',
          controller: cubit.nameController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Icons.person_outline,
            color: Colors.grey[600],
            size: 20.r,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your full name';
            }
            if (value.length < 2) {
              return 'Name must be at least 2 characters';
            }
            return null;
          },
        ),
        verticalSpace(16),
    
        // Email
        UniversalFormField(
          hintText: 'Email',
          controller: cubit.emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Icons.email_outlined,
            color: Colors.grey[600],
            size: 20.r,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        verticalSpace(16),
    
        // Phone Number
        UniversalFormField(
          hintText: 'Phone Number',
          controller: cubit.phoneController,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Icons.phone_outlined,
            color: Colors.grey[600],
            size: 20.r,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your phone number';
            }
            if (value.length < 10) {
              return 'Phone number must be at least 10 digits';
            }
            if (!RegExp(r'^\+?[0-9]+$').hasMatch(value.replaceAll(' ', ''))) {
              return 'Please enter a valid phone number';
            }
            return null;
          },
        ),
        verticalSpace(16),
    
        // Address
        UniversalFormField(
          hintText: 'Address',
          controller: cubit.addressController,
          keyboardType: TextInputType.streetAddress,
          textInputAction: TextInputAction.next,
          maxLines: 2,
          prefixIcon: Icon(
            Icons.location_on_outlined,
            color: Colors.grey[600],
            size: 20.r,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your address';
            }
            if (value.length < 5) {
              return 'Address must be more detailed';
            }
            return null;
          },
        ),
        verticalSpace(16),
    
        // Password
        UniversalFormField(
          hintText: 'Password',
          controller: cubit.passwordController,
          isObscureText: isPasswordHidden,
          textInputAction: TextInputAction.done,
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Colors.grey[600],
            size: 20.r,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isPasswordHidden = !isPasswordHidden;
              });
            },
            icon: Icon(
              isPasswordHidden ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[600],
              size: 20.r,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)').hasMatch(value)) {
              return 'Password must contain letters and numbers';
            }
            return null;
          },
        ),
      ],
    );
  }
}