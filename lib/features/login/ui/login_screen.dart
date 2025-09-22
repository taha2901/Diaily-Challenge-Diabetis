// import 'package:challenge_diabetes/core/widget/app_text_form_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:iconsax/iconsax.dart';

// import '../../../../core/helpers/spacing.dart';
// import '../../../../core/theming/colors.dart';
// import '../../../../core/theming/styles.dart';
// import '../../../../core/widget/app_text_button.dart';
// import '../logic/cubit/login_cubit.dart';
// import '../logic/cubit/login_state.dart';
// import '../../../../core/routings/routers.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool isPasswordVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<LoginCubit>();

//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: BlocListener<LoginCubit, LoginState>(
//           listener: (context, state) {
//             state.whenOrNull(
//               success: (data) {
//                 FocusScope.of(context).unfocus();
//                 Navigator.pushReplacementNamed(context, Routers.bottomNavBar);
//               },
//               error: (error) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(error, textAlign: TextAlign.center),
//                     backgroundColor: Colors.red.shade400,
//                     behavior: SnackBarBehavior.floating,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     duration: const Duration(seconds: 3),
//                   ),
//                 );
//               },
//             );
//           },
//           child: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//             keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 verticalSpace(60),
//                 // Welcome Section
//                 _buildWelcomeSection(),
//                 verticalSpace(50),
//                 // Form Section
//                 _buildFormSection(cubit),
//                 verticalSpace(30),
//                 // Register Navigation Section
//                 _buildRegisterSection(),
//                 verticalSpace(40),
//               ],
//             ),
//           ),
//         ),
//       ),

//       bottomNavigationBar: _buildBottomButton(cubit),
//     );
//   }

//   // Welcome Section
//   Widget _buildWelcomeSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           '👋 مرحبًا مجددًا',
//           style: TextStyles.font24BlueBold,
//         ),
//         verticalSpace(8),
//         Text(
//           'أهلاً بك، يُسعدنا رؤيتك مرة أخرى!',
//           style: TextStyles.font14greyRegular,
//         ),
//       ],
//     );
//   }

//   // Form Section
//   Widget _buildFormSection(LoginCubit cubit) {
//     return Form(
//       key: cubit.formKey,
//       child: Column(
//         children: [
//           // Email Field
//           UniversalFormField(
//             hintText: 'البريد الإلكتروني',
//             prefixIcon: const Icon(Iconsax.direct_right),
//             controller: cubit.emailController,
//             keyboardType: TextInputType.emailAddress,
//             textInputAction: TextInputAction.next,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'البريد الإلكتروني مطلوب';
//               }
//               if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                 return 'أدخل بريدًا إلكترونيًا صالحًا';
//               }
//               return null;
//             },
//           ),

//           verticalSpace(20),

//           // Password Field
//           UniversalFormField(
//             hintText: 'كلمة المرور',
//             prefixIcon: const Icon(Iconsax.lock),
//             controller: cubit.passwordController,
//             isObscureText: !isPasswordVisible,
//             textInputAction: TextInputAction.done,
//             onFieldSubmitted: (_) => _handleLogin(cubit),
//             suffixIcon: IconButton(
//               onPressed: () {
//                 setState(() {
//                   isPasswordVisible = !isPasswordVisible;
//                 });
//               },
//               icon: Icon(
//                 isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                 color: Colors.grey,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'كلمة المرور مطلوبة';
//               }
//               if (value.length < 6) {
//                 return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
//               }
//               return null;
//             },
//           ),

//           verticalSpace(16),

//           // Forgot Password
//           Align(
//             alignment: Alignment.centerRight,
//             child: TextButton(
//               onPressed: () {
//                 // TODO: Navigate to forgot password screen
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('ميزة استرداد كلمة المرور ستكون متاحة قريبًا'),
//                     backgroundColor: ColorsManager.mainBlue,
//                   ),
//                 );
//               },
//               style: TextButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//               ),
//               child: Text(
//                 'هل نسيت كلمة المرور؟',
//                 style: TextStyles.font13BlueRegular.copyWith(
//                   decoration: TextDecoration.underline,
//                 ),
//               ),
//             ),
//           ),

//           // Loading Indicator
//           BlocBuilder<LoginCubit, LoginState>(
//             buildWhen: (previous, current) => 
//               (previous is Loading) != (current is Loading),
//             builder: (context, state) {
//               if (state is Loading) {
//                 return Column(
//                   children: [
//                     verticalSpace(30),
//                     const Center(
//                       child: CircularProgressIndicator(
//                         color: ColorsManager.mainBlue,
//                         strokeWidth: 2.5,
//                       ),
//                     ),
//                   ],
//                 );
//               }
//               return const SizedBox.shrink();
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   // Register Navigation Section
//   Widget _buildRegisterSection() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade50,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(
//           color: Colors.grey.shade200,
//           width: 1,
//         ),
//       ),
//       child: Column(
//         children: [
//           Icon(
//             Iconsax.user_add,
//             size: 32,
//             color: ColorsManager.mainBlue.withOpacity(0.7),
//           ),
//           verticalSpace(12),
//           Text(
//             'ليس لديك حساب؟',
//             style: TextStyles.font14greyRegular.copyWith(
//               color: Colors.grey.shade700,
//             ),
//           ),
//           verticalSpace(12),
//           SizedBox(
//             width: double.infinity,
//             child: OutlinedButton.icon(
//               onPressed: () {
//                 Navigator.pushNamed(context, Routers.register);
//               },
//               style: OutlinedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 side: BorderSide(
//                   color: ColorsManager.mainBlue.withOpacity(0.3),
//                   width: 1.5,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               icon: Icon(
//                 Iconsax.arrow_left_2,
//                 size: 18,
//                 color: ColorsManager.mainBlue,
//               ),
//               label: Text(
//                 'إنشاء حساب جديد',
//                 style: TextStyles.font14BlueSemiBold.copyWith(
//                   color: ColorsManager.mainBlue,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Bottom Login Button
//   Widget _buildBottomButton(LoginCubit cubit) {
//     return BlocBuilder<LoginCubit, LoginState>(
//       buildWhen: (previous, current) => 
//         (previous is Loading) != (current is Loading),
//       builder: (context, state) {
//         final isLoading = state is Loading;
//         return SafeArea(
//           child: Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.shade300,
//                   offset: const Offset(0, -2),
//                   blurRadius: 10,
//                   spreadRadius: 0,
//                 ),
//               ],
//             ),
//             child: AppTextButton(
//               buttonText: isLoading ? 'جاري تسجيل الدخول...' : 'تسجيل الدخول',
//               isLoading: isLoading,
//               textStyle: TextStyles.font16WhiteSemiBold,
//               backgroundColor: isLoading 
//                 ? ColorsManager.mainBlue.withOpacity(0.7)
//                 : ColorsManager.mainBlue,
//               onPressed:() =>  isLoading ? null : () => _handleLogin(cubit),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // Handle Login Logic
//   void _handleLogin(LoginCubit cubit) {
//     // Dismiss keyboard
//     FocusScope.of(context).unfocus();
    
//     // Validate and submit
//     if (cubit.formKey.currentState!.validate()) {
//       cubit.emitLoginState();
//     }
//   }
// }


import 'package:challenge_diabetes/core/widget/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_text_button.dart';
import '../logic/cubit/login_cubit.dart';
import '../logic/cubit/login_state.dart';
import '../../../../core/routings/routers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            print('🎯 State changed: $state'); // Debug
            state.whenOrNull(
              success: (data) {
                print('🎉 Login success: $data'); // Debug
                FocusScope.of(context).unfocus();
                Navigator.pushReplacementNamed(context, Routers.bottomNavBar);
              },
              error: (error) {
                print('💥 Login error: $error'); // Debug
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error, textAlign: TextAlign.center),
                    backgroundColor: Colors.red.shade400,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
            );
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(60),
                // Welcome Section
                _buildWelcomeSection(),
                verticalSpace(50),
                // Form Section
                _buildFormSection(cubit),
                verticalSpace(30),
                // Register Navigation Section
                _buildRegisterSection(),
                verticalSpace(40),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: _buildBottomButton(cubit),
    );
  }

  // Welcome Section
  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '👋 مرحبًا مجددًا',
          style: TextStyles.font24BlueBold,
        ),
        verticalSpace(8),
        Text(
          'أهلاً بك، يُسعدنا رؤيتك مرة أخرى!',
          style: TextStyles.font14greyRegular,
        ),
      ],
    );
  }

  // Form Section
  Widget _buildFormSection(LoginCubit cubit) {
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          // Email Field
          UniversalFormField(
            hintText: 'البريد الإلكتروني',
            prefixIcon: const Icon(Iconsax.direct_right),
            controller: cubit.emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'البريد الإلكتروني مطلوب';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'أدخل بريدًا إلكترونيًا صالحًا';
              }
              return null;
            },
          ),

          verticalSpace(20),

          // Password Field
          UniversalFormField(
            hintText: 'كلمة المرور',
            prefixIcon: const Icon(Iconsax.lock),
            controller: cubit.passwordController,
            isObscureText: !isPasswordVisible,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _handleLogin(cubit),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'كلمة المرور مطلوبة';
              }
              if (value.length < 6) {
                return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
              }
              return null;
            },
          ),

          verticalSpace(16),

          // Forgot Password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // TODO: Navigate to forgot password screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('ميزة استرداد كلمة المرور ستكون متاحة قريبًا'),
                    backgroundColor: ColorsManager.mainBlue,
                  ),
                );
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              ),
              child: Text(
                'هل نسيت كلمة المرور؟',
                style: TextStyles.font13BlueRegular.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),

          // Loading Indicator
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) => 
              (previous is Loading) != (current is Loading),
            builder: (context, state) {
              if (state is Loading) {
                return Column(
                  children: [
                    verticalSpace(30),
                    const Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.mainBlue,
                        strokeWidth: 2.5,
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  // Register Navigation Section
  Widget _buildRegisterSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Iconsax.user_add,
            size: 32,
            color: ColorsManager.mainBlue.withOpacity(0.7),
          ),
          verticalSpace(12),
          Text(
            'ليس لديك حساب؟',
            style: TextStyles.font14greyRegular.copyWith(
              color: Colors.grey.shade700,
            ),
          ),
          verticalSpace(12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, Routers.register);
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(
                  color: ColorsManager.mainBlue.withOpacity(0.3),
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: Icon(
                Iconsax.arrow_left_2,
                size: 18,
                color: ColorsManager.mainBlue,
              ),
              label: Text(
                'إنشاء حساب جديد',
                style: TextStyles.font14BlueSemiBold.copyWith(
                  color: ColorsManager.mainBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Bottom Login Button
  Widget _buildBottomButton(LoginCubit cubit) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => 
        (previous is Loading) != (current is Loading),
      builder: (context, state) {
        final isLoading = state is Loading;
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(0, -2),
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: AppTextButton(
              buttonText: isLoading ? 'جاري تسجيل الدخول...' : 'تسجيل الدخول',
              isLoading: isLoading,
              textStyle: TextStyles.font16WhiteSemiBold,
              backgroundColor: isLoading 
                ? ColorsManager.mainBlue.withOpacity(0.7)
                : ColorsManager.mainBlue,
              onPressed:()  => _handleLogin(cubit),
            ),
          ),
        );
      },
    );
  }

  // Handle Login Logic
  void _handleLogin(LoginCubit cubit) {
    print('🔥 _handleLogin called'); // Debug
    
    // Dismiss keyboard
    FocusScope.of(context).unfocus();
    
    // Check form validation
    if (cubit.formKey.currentState!.validate()) {
      print('✅ Form is valid'); // Debug
      print('📧 Email: ${cubit.emailController.text}'); // Debug
      print('🔐 Password: ${cubit.passwordController.text.isNotEmpty ? "***" : "empty"}'); // Debug
      
      // Call login
      cubit.emitLoginState();
    } else {
      print('❌ Form validation failed'); // Debug
    }
  }
}