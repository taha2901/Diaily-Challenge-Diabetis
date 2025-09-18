import 'package:challenge_diabetes/core/di/dependency_injection.dart';
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/widget/cutom_app_bar.dart';
import 'package:challenge_diabetes/features/profile/logic/profile_cubit.dart';
import 'package:challenge_diabetes/features/profile/logic/profile_state.dart';
import 'package:challenge_diabetes/features/profile/ui/change_pass_screen.dart';
import 'package:challenge_diabetes/features/profile/ui/edit_profile_screen.dart';
import 'package:challenge_diabetes/features/profile/ui/widget/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return BlocProvider(
      create: (context) => getit<ProfileCubit>()..getUserData(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorsManager.mainBackGround,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(),
                    verticalSpace(40),

                    // 🟢 Edit profile
                    SettingItem(
                      color: t.colorScheme.primary,
                      icon: Iconsax.profile_2user,
                      title: 'Edit Profile',
                      onTap: () {
                    Navigator.of(context).push( 
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: ProfileCubit.get(context),
                          child: const EditProfilePage(),
                        ),
                      ),
                    )    ;
                      },
                    ),

                    verticalSpace(12),

                    // 🟢 Change password
                    SettingItem(
                      color: Colors.orange,
                      icon: Iconsax.password_check4,
                      title: 'Change Password',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: ProfileCubit.get(context),
                              child: const ChangePasswordPage(),
                            ),
                          ),
                        );
                      },
                    ),

                    verticalSpace(12),

                    // 🟢 Notifications
                    SettingItem(
                      color: Colors.blue,
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      onTap: () {},
                    ),

                    verticalSpace(12),

                    // 🟢 Toggle Theme
                    SettingItem(
                      color: Colors.purple,
                      icon: Iconsax.moon,
                      title: "Toggle Theme",
                      onTap: () async {},
                    ),

                    verticalSpace(12),

                    // 🟢 Security
                    SettingItem(
                      color: Colors.red,
                      icon: Iconsax.reserve,
                      title: 'User Reservation',
                      onTap: () {
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).pushNamed(Routers.myReservation);
                      },
                    ),

                    verticalSpace(12),

                    // 🟢 Language
                    SettingItem(
                      color: Colors.teal,
                      icon: Iconsax.language_circle4,
                      title: 'Language',
                      onTap: () {
                        // showDialog(
                        //   context: context,
                        //   builder: (_) => const LanguageDialog(),
                        // );
                      },
                    ),

                    verticalSpace(12),

                    // 🟢 Logout
                    SettingItem(
                      color: t.colorScheme.error, // متوافق مع Light/Dark
                      icon: Iconsax.logout,
                      title: 'Logout',
                      onTap: () async {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
