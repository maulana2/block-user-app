import 'package:cps_soft/domain/entities/user.dart';
import 'package:cps_soft/presentation/widgets/detail_profile_card.dart';
import 'package:cps_soft/utils/colors.dart';
import 'package:cps_soft/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final User user;

  ProfileCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.profileImageUrl!),
              radius: 30,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      user.name,
                      style: AppStyles.bodyText1.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DetailProfileCard(
                              title: user.phoneNumber,
                              icons: Icons.phone_android_rounded,
                            ),
                            DetailProfileCard(
                              title: user.email,
                              icons: Icons.email_rounded,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DetailProfileCard(
                              title: user.address,
                              icons: Icons.pin_drop_rounded,
                            ),
                            DetailProfileCard(
                              title: user.city,
                              icons: Icons.location_city_rounded,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
