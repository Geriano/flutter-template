import 'package:flutter/material.dart';
import 'package:template/pages/dashboard/layout.dart';
import 'package:template/pages/profile/general_information.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const DashboardLayout(
      children: [
        GeneralInformation(),
      ],
    );
  }
}