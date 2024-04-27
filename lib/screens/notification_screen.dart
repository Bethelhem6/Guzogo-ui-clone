import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guzo_go_clone/constants/app_constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: AppConstants.largeMargin,
            vertical: AppConstants.largeMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Notifications",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.largeFont),
            ),
            const SizedBox(
              height: 20,
            ),
            notificationCard(context, "VISA / MasterCard", "28/02/2022"),
            // notificationCard(
            //   context,
            // ),
          ],
        ),
      )),
    );
  }

  Container notificationCard(
      BuildContext context, String title, String subtitle) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          boxShadow: const [
            BoxShadow(
                color: AppConstants.grey400,
                blurRadius: 2,
                offset: Offset(0, 1))
          ]),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.mediumFont),
            ),
            Text(
              subtitle,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppConstants.textGrey,
                  fontSize: AppConstants.smallFont),
            )
          ],
        ),
      ),
    );
  }
}
