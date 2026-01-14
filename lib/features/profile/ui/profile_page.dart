import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:challenge_diabetes/core/di/dependency_injection.dart';
import 'package:challenge_diabetes/core/helpers/shared_pref_helper.dart';
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/networking/dio_factory.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/widget/cutom_app_bar.dart';
import 'package:challenge_diabetes/features/profile/logic/profile_cubit.dart';
import 'package:challenge_diabetes/features/profile/logic/profile_state.dart';
import 'package:challenge_diabetes/features/profile/ui/change_pass_screen.dart';
import 'package:challenge_diabetes/features/profile/ui/edit_profile_screen.dart';
import 'package:challenge_diabetes/features/profile/ui/widget/language_dialouge.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return BlocProvider(
      create: (context) => getit<ProfileCubit>()..getUserData(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: t.colorScheme.onPrimary,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Header Section
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            t.colorScheme.primary.withOpacity(0.1),
                            t.colorScheme.primary.withOpacity(0.05),
                          ],
                        ),
                      ),
                      child: const CustomAppBar(),
                    ),

                    // Settings List
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 32),

                          // Account Section
                          _buildSectionHeader(
                            context,
                            LocaleKeys.account_settings.tr(),
                          ),
                          const SizedBox(height: 16),

                          ModernSettingItem(
                            icon: Iconsax.profile_2user,
                            title: LocaleKeys.edit_profile.tr(),
                            subtitle: LocaleKeys.edit_profile_sub.tr(),
                            iconColor: t.colorScheme.primary,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value: ProfileCubit.get(context),
                                    child: const EditProfilePage(),
                                  ),
                                ),
                              );
                            },
                          ),

                          ModernSettingItem(
                            icon: Iconsax.password_check4,
                            title: LocaleKeys.change_password.tr(),
                            subtitle: LocaleKeys.change_password_sub.tr(),
                            iconColor: Colors.orange.shade600,
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

                          const SizedBox(height: 40),

                          // Preferences Section
                          _buildSectionHeader(
                            context,
                            LocaleKeys.preferences.tr(),
                          ),
                          const SizedBox(height: 16),

                          ModernSettingItem(
                            icon: Iconsax.notification,
                            title: LocaleKeys.notifications.tr(),
                            subtitle: LocaleKeys.notifications_sub.tr(),
                            iconColor: Colors.blue.shade600,
                            onTap: () {},
                          ),

                          ModernSettingItem(
                            icon: Iconsax.moon,
                            title: LocaleKeys.toggle_theme.tr(),
                            subtitle: LocaleKeys.toggle_theme_sub.tr(),
                            iconColor: Colors.purple.shade600,
                            onTap: () async {
                              AdaptiveTheme.of(context).toggleThemeMode();
                            },
                          ),

                          ModernSettingItem(
                            icon: Iconsax.language_circle4,
                            title: LocaleKeys.language.tr(),
                            subtitle: LocaleKeys.language_sub.tr(),
                            iconColor: Colors.teal.shade600,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => const LanguageDialog(),
                              );
                              debugPrint(
                                'Language Dialog Opened ${context.locale}',
                              );
                            },
                          ),

                          verticalSpace(40),

                          // Other Section
                          _buildSectionHeader(
                            context,
                            LocaleKeys.other_other.tr(),
                          ),
                          const SizedBox(height: 16),

                          ModernSettingItem(
                            icon: Iconsax.reserve,
                            title: LocaleKeys.my_reservations.tr(),
                            subtitle: LocaleKeys.my_reservations_sub.tr(),
                            iconColor: Colors.green.shade600,
                            onTap: () {
                              Navigator.of(
                                context,
                                rootNavigator: true,
                              ).pushNamed(Routers.myReservation);
                            },
                          ),

                          const SizedBox(height: 32),

                          // Logout Button
                          _buildLogoutButton(context),

                          const SizedBox(height: 40),
                        ],
                      ),
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

  Widget _buildSectionHeader(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: theme.colorScheme.primary,
          letterSpacing: -0.5,
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () async {
          // امسح بيانات التخزين مع بعض
          await Future.wait<void>([
            SharedPrefHelper.clearAllData() as Future<void>,
            SharedPrefHelper.clearAllSecuredData() as Future<void>,
          ]);

          // امسح التوكن من Dio
          DioFactory.setTokenIntoHeaderAfterLogin(null);
          DioFactory.resetDio();

          Navigator.of(
            context,
            rootNavigator: true,
          ).pushNamedAndRemoveUntil(Routers.login, (route) => false);
        },

        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.colorScheme.error.withOpacity(0.3),
              width: 1.5,
            ),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                theme.colorScheme.error.withOpacity(0.05),
                theme.colorScheme.error.withOpacity(0.02),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.logout, color: theme.colorScheme.error, size: 22),
              const SizedBox(width: 12),
              Text(
                LocaleKeys.logout.tr(),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.error,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModernSettingItem extends StatefulWidget {
  final IconData? icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color iconColor;

  const ModernSettingItem({
    super.key,
    this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.iconColor,
  });

  @override
  State<ModernSettingItem> createState() => _ModernSettingItemState();
}

class _ModernSettingItemState extends State<ModernSettingItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                _animationController.forward().then((_) {
                  _animationController.reverse();
                });
                widget.onTap();
              },
              onTapDown: (_) => _animationController.forward(),
              onTapCancel: () => _animationController.reverse(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    bottom: BorderSide(
                      color: theme.dividerColor.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    // Icon Container
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            widget.iconColor.withOpacity(0.2),
                            widget.iconColor.withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        widget.icon,
                        color: widget.iconColor,
                        size: 24,
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Text Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.subtitle,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.textTheme.bodySmall?.color
                                  ?.withOpacity(0.7),
                              fontSize: 13,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Arrow Icon
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: theme.iconTheme.color?.withOpacity(0.4),
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
