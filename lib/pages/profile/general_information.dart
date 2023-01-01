import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/pages/profile/input.dart';
import 'package:template/pages/profile/photo.dart';
import 'package:template/providers/auth.dart';
import 'package:template/providers/profile_general_information.dart';

class GeneralInformation extends StatefulWidget {
  const GeneralInformation({super.key});

  @override
  GeneralInformationState createState() => GeneralInformationState();
}

class GeneralInformationState extends State<GeneralInformation> {
  @override
  Widget build(BuildContext context) {
    var auth = context.watch<AuthProvider>();
    var user = auth.user!;
    var profileGeneralInformation = context.watch<ProfileGeneralInformation>();
    var width = MediaQuery.of(context).size.width;

    if (profileGeneralInformation.nameController.text.isEmpty) {
      profileGeneralInformation.nameController.text = user.name;
    }

    if (profileGeneralInformation.usernameController.text.isEmpty) {
      profileGeneralInformation.usernameController.text = user.username;
    }

    if (profileGeneralInformation.emailController.text.isEmpty) {
      profileGeneralInformation.emailController.text = user.email;
    }

    return SizedBox(
      width: width,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 15.h,
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200
                      ),
                    ),
                    child: Stack(
                      children: const [
                        Photo(),
                      ],
                    ),
                  ),
                  ProfileInput(
                    controller: profileGeneralInformation.nameController,
                    autofocus: true,
                    label: 'Name',
                    error: profileGeneralInformation.errors['name'],
                  ),
                  ProfileInput(
                    controller: profileGeneralInformation.usernameController,
                    label: 'Username',
                    error: profileGeneralInformation.errors['username'],
                  ),
                  ProfileInput(
                    controller: profileGeneralInformation.emailController,
                    label: 'Email',
                    error: profileGeneralInformation.errors['email'],
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 5.h,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4.h),
                  bottomRight: Radius.circular(4.h),
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade800,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 20.h,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}