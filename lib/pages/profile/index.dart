import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/pages/dashboard/layout.dart';
import 'package:template/providers/auth.dart';
import 'package:template/route.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  var open = {
    'profileMenuOption': false,
  };

  @override
  Widget build(BuildContext context) {
    var auth = context.watch<AuthProvider>();
    var user = auth.user!;
    var width = MediaQuery.of(context).size.width;
    
    return DashboardLayout(
      children: [
        SizedBox(
          width: width,
          child: Card(
            child: Padding(
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
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 100.h,
                                  height: 100.h,
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(9999),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(9999),
                                    child: Builder(
                                      builder: (context) {
                                        if (user.profilePhotoUrl == null) {
                                          return const Icon(Icons.account_circle, size: 128, color: Colors.grey,);
                                        }

                                        return Image.network(
                                          staticRoute(user.profilePhotoUrl!).toString(),
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.account_circle),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5.h,
                                  right: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9999)
                                      ),
                                      color: Colors.blue,
                                    ),
                                    child: IconButton(
                                      onPressed: () => setState(() {
                                        open['profileMenuOption'] = !open['profileMenuOption']!;
                                      }),
                                      icon: const Icon(
                                        Icons.list,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            if (open['profileMenuOption']!) Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {}, 
                                  child: Row(
                                    children: const [
                                      Icon(Icons.sync),
                                      SizedBox(width: 5),
                                      Text('Change'),
                                    ],
                                  ),
                                ),
                                if (user.profilePhotoUrl != null) SizedBox(width: 5.h),
                                if (user.profilePhotoUrl != null) ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  onPressed: () {}, 
                                  child: Row(
                                    children: const [
                                      Icon(Icons.delete),
                                      SizedBox(width: 5),
                                      Text('Remove'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}