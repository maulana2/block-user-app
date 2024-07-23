import 'package:cps_soft/utils/colors.dart';
import 'package:cps_soft/utils/styles.dart';
import 'package:flutter/material.dart';

class DetailProfileCard extends StatelessWidget {
  const DetailProfileCard(
      {super.key, required this.title, required this.icons});

  final String title;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icons, size: 14, color: AppColors.grey),
        SizedBox(width: 4),
        Expanded(
          child: Text(
            title,
            style: AppStyles.headline2.copyWith(
              color: AppColors.grey,
              fontSize: 14,
            ),
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
