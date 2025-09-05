import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/widget/app_text_form_field.dart';
import 'package:challenge_diabetes/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPassword extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const EmailAndPassword({super.key, required this.formKey});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isPasswordHidden = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          // Email Field
          UniversalFormField(
            hintText: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textAlign:  TextAlign.start,
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
          verticalSpace(20),
          
          // Password Field
          UniversalFormField(
            controller: passwordController,
            hintText: 'Password',
            textAlign:  TextAlign.start,
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
              return null;
            },
          ),
        ],
      ),
    );
  }
}