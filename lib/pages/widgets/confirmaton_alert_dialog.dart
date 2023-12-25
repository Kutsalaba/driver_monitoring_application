import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/app_colors.dart';

class ConfirmationAlertDialog extends StatelessWidget {
  const ConfirmationAlertDialog({super.key, required this.onPressed});

  final Future<void> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(
            Icons.warning,
            color: Colors.orange,
          ),
          SizedBox(width: 32.w),
          Text(
            'Confirmation',
            style: Theme.of(context).primaryTextTheme.displayMedium?.copyWith(
                  color: AppColors.black,
                ),
          ),
        ],
      ),
      content: Text(
        'Are you sure you want to proceed?',
        style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            var router = AutoRouter.of(context);
            await onPressed.call();

            router.pop();
          },
          child: Text(
            'Confirm',
            style: Theme.of(context).primaryTextTheme.displaySmall?.copyWith(
                  color: AppColors.black,
                ),
          ),
        ),
        TextButton(
          onPressed: () {
            AutoRouter.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: Theme.of(context).primaryTextTheme.displaySmall?.copyWith(
                  color: AppColors.black,
                ),
          ),
        ),
      ],
    );
  }
}
