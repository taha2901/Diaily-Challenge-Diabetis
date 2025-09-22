import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_state.dart';
import 'package:challenge_diabetes/features/doctor/model/data/user_reservations_response_body.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class MyReservationsScreen extends StatelessWidget {
  const MyReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          LocaleKeys.my_reservations.tr(),
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: theme.iconTheme.color,
          ),
        ),
      ),
      body: BlocConsumer<DoctorsCubit, DoctorsState>(
        listener: (context, state) {
          if (state is DeleteReservationSuccess) {
            context.read<DoctorsCubit>().getUserReservation();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text(LocaleKeys.delete_success.tr()),
                  ],
                ),
                backgroundColor: Colors.green.shade600,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.all(16),
              ),
            );
          } else if (state is DeleteReservationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(Icons.error, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        LocaleKeys.delete_failed.tr(
                          args: [state.apiErrorModel.title.toString()],
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.red.shade600,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.all(16),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UserReservationLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 3,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    LocaleKeys.loading_reservations.tr(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodyMedium?.color?.withOpacity(
                        0.7,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is UserReservationSuccess) {
            final reservations = state.reservations;

            if (reservations.isEmpty) {
              return _buildEmptyState(context);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section with Count
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                  child: Row(
                    children: [
                      Text(LocaleKeys.your_reservations.tr()),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          LocaleKeys.reservation_count.tr(
                            args: ['${reservations.length}'],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Reservations List
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                    itemCount: reservations.length,
                    itemBuilder: (context, index) {
                      return ModernReservationItem(
                        reservation: reservations[index],
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is UserReservationError) {
            return _buildErrorState(context);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Iconsax.calendar_remove,
                size: 60,
                color: theme.colorScheme.primary.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              LocaleKeys.no_reservations.tr(),
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.textTheme.headlineSmall?.color?.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              LocaleKeys.add_reservation_hint.tr(),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Iconsax.warning_2,
                size: 60,
                color: Colors.red.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              LocaleKeys.error_fetching.tr(),
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.textTheme.headlineSmall?.color?.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              LocaleKeys.check_connection.tr(),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ModernReservationItem extends StatefulWidget {
  final ReservationModel reservation;
  final int index;

  const ModernReservationItem({
    super.key,
    required this.reservation,
    required this.index,
  });

  @override
  State<ModernReservationItem> createState() => _ModernReservationItemState();
}

class _ModernReservationItemState extends State<ModernReservationItem>
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
    final doctor = widget.reservation.doctor;

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: theme.dividerColor.withOpacity(0.1),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor Info Row
                Row(
                  children: [
                    // Doctor Avatar
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: theme.colorScheme.primary.withOpacity(0.2),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.primary.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: doctor?.photo != null
                            ? Image.network(
                                doctor!.photo!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return _buildDefaultAvatar(theme);
                                },
                              )
                            : _buildDefaultAvatar(theme),
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Doctor Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor?.name ?? LocaleKeys.unknown_doctor.tr(),
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          if (doctor?.specialty != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withOpacity(
                                  0.1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                doctor!.specialty!,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                    // Delete Button
                    _buildDeleteButton(context, theme),
                  ],
                ),

                verticalSpace(16),

                // Appointment Details
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      // Date
                      Expanded(
                        child: _buildDetailItem(
                          context,
                          icon: Iconsax.calendar_1,
                          title: LocaleKeys.date.tr(),
                          value:
                              widget.reservation.date
                                  ?.toLocal()
                                  .toString()
                                  .split(" ")[0] ??
                              LocaleKeys.not_specified.tr(),
                        ),
                      ),

                      Container(
                        height: 40,
                        width: 1,
                        color: theme.dividerColor.withOpacity(0.3),
                      ),

                      // Time
                      Expanded(
                        child: _buildDetailItem(
                          context,
                          icon: Iconsax.clock,
                          title: LocaleKeys.time.tr(),
                          value:
                              widget.reservation.time ??
                              LocaleKeys.not_specified.tr(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDefaultAvatar(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary.withOpacity(0.2),
            theme.colorScheme.primary.withOpacity(0.1),
          ],
        ),
      ),
      child: Icon(Iconsax.user, size: 28, color: theme.colorScheme.primary),
    );
  }

  Widget _buildDeleteButton(BuildContext context, ThemeData theme) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        _animationController.forward().then((_) {
          _animationController.reverse();
        });
        _showDeleteDialog(context, widget.reservation.reservationId!);
      },
      onTapDown: (_) => _animationController.forward(),
      onTapCancel: () => _animationController.reverse(),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(Iconsax.trash, color: Colors.red.shade600, size: 20),
      ),
    );
  }

  Widget _buildDetailItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Icon(icon, size: 20, color: theme.colorScheme.primary),
        const SizedBox(height: 4),
        Text(
          title,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  void _showDeleteDialog(BuildContext rootContext, int reservationId) {
    final theme = Theme.of(rootContext);

    showDialog(
      context: rootContext,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Iconsax.warning_2, color: Colors.red.shade600, size: 24),
            const SizedBox(width: 8),
            Text(
              LocaleKeys.delete_confirm_title.tr(),
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        content: Text(LocaleKeys.delete_confirm_message.tr()),

        actions: [
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              LocaleKeys.cancel.tr(),
              style: TextStyle(
                color: theme.textTheme.bodyLarge?.color,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () => Navigator.pop(dialogContext),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              LocaleKeys.delete.tr(),
              style: TextStyle(
                color: Colors.red.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              rootContext.read<DoctorsCubit>().deleteReservation(
                reservationId,
                rootContext,
              );
              Navigator.pop(dialogContext);
            },
          ),
        ],
      ),
    );
  }
}
