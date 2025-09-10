import 'package:challenge_diabetes/features/home/ui/home_page.dart';
import 'package:challenge_diabetes/features/measurments/ui/measurments_screen.dart';
import 'package:challenge_diabetes/features/profile/ui/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late final PersistentTabController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  List<Widget> _buildScreens() {
    return [DiabetesHomePage(), MeasurementsScreen(), ProfilePage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    final theme = Theme.of(context);
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: 'Home',
        activeColorPrimary: theme.colorScheme.primary,
        inactiveColorPrimary: theme.disabledColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.bag_tick),
        title: 'measurments',
        activeColorPrimary: theme.colorScheme.primary,
        inactiveColorPrimary: theme.disabledColor,
      ),

      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: 'Profile',
        activeColorPrimary: theme.colorScheme.primary,
        inactiveColorPrimary: theme.disabledColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBody: true,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        onItemSelected: (value) {
          setState(() {
            currentIndex = value;
            debugPrint('Current Index is $currentIndex');
          });
        },
        items: _navBarsItems(context),
        navBarStyle: NavBarStyle.style9,
        backgroundColor:
            theme.bottomNavigationBarTheme.backgroundColor ??
            theme.colorScheme.surface,
        decoration: NavBarDecoration(
          colorBehindNavBar:
              theme.bottomNavigationBarTheme.backgroundColor ??
              theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, -2),
            ),
          ],
        ),
      ),
    );
  }
}
