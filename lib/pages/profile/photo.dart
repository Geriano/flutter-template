import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:template/providers/auth.dart';
import 'package:template/route.dart';

class Photo extends StatefulWidget {
  const Photo({super.key});

  @override
  PhotoState createState() => PhotoState();
}

class PhotoState extends State<Photo> {
  var open = {
    'profileMenuOption': false,
  };

  @override
  Widget build(BuildContext context) {
    var auth = context.watch<AuthProvider>();
    var user = auth.user!;
    
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.h,
      ),
      child: Column(
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
              AnimatedPositioned(
                bottom: 5.h,
                right: 0,
                duration: const Duration(milliseconds: 300),
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
    );
  }
}
