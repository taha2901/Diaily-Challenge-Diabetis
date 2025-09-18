import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:flutter/material.dart';

class DoctorAvatarWidget extends StatelessWidget {
  final String photo;

  const DoctorAvatarWidget({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: photo.isNotEmpty
            ? Image.network(
                photo,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _buildDefaultAvatar(),
              )
            : _buildDefaultAvatar(),
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      color: Colors.white,
      child: const Icon(
        Icons.person,
        color: ColorsManager.mainBlue,
        size: 30,
      ),
    );
  }
}
