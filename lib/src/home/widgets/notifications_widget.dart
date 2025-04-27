import 'package:doula/common/services/storage.dart';
import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/common/widgets/login_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Storage().getString("accessToken") == null) {
          loginBottomSheet(context);
          print("USER IS NOT LOGIN");
        } else {
          GoRouter.of(context).go('/notifications');
        }
      },
      child: Padding(
        padding: EdgeInsets.only(right: 12),
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Kolors.kRed,
          child: Badge(
            backgroundColor: Kolors.kWhite,
            label: const Text(
              '33',
              style: TextStyle(
                color: Kolors.kRed,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            child: const Icon(Icons.notifications, color: Kolors.kWhite),
          ),
        ),
      ),
    );
  }
}
