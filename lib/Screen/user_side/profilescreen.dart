import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../utils/firebase.dart';
import '../../utils/notification_permistion.dart';

// ignore: camel_case_types
class profilescreen extends StatefulWidget {
  const profilescreen({super.key});

  @override
  State<profilescreen> createState() => _profilescreenState();
}

// ignore: camel_case_types
class _profilescreenState extends State<profilescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Your Profile",
                  style: GoogleFonts.alice(
                      fontSize: 20,
                      letterSpacing: 1,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          CircleAvatar(
            backgroundColor: Colors.deepOrangeAccent.shade200,
            radius: 80,
            child: const Icon(Icons.person, size: 35, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            "Ravina Baldaniya",
            style: GoogleFonts.alice(
              fontSize: 15,
              letterSpacing: 1,
              color: Colors.black54,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Ravina999@gmail.com",
            style: GoogleFonts.alice(
              fontSize: 15,
              letterSpacing: 1,
              color: Colors.black54,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Color(0xff07635d),
            ),
            title: Text(
              ' My Profile ',
              style: GoogleFonts.lato(
                fontSize: 12.sp,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.book,
              color: Color(0xff07635d),
            ),
            title: Text(
              ' Big Picture ',
              style: GoogleFonts.lato(
                fontSize: 12.sp,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Notification_permision.service.bigpicturenotification();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.people_alt_rounded,
              color: Color(0xff07635d),
            ),
            title: Text(
              ' Users ',
              style: GoogleFonts.lato(
                fontSize: 12.sp,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.admin_panel_settings,
              color: Color(0xff07635d),
            ),
            title: Text(
              ' Admin ',
              style: GoogleFonts.lato(
                fontSize: 12.sp,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Get.toNamed('eHome');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.edit,
              color: Color(0xff07635d),
            ),
            title: Text(
              ' Edit Profile Image',
              style: GoogleFonts.lato(
                fontSize: 12.sp,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            onTap: () async {},
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Color(0xff07635d),
            ),
            title: Text(
              'LogOut',
              style: GoogleFonts.lato(
                fontSize: 12.sp,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            onTap: () async {
              await FirebaseHelper.firehelper.user_logout();
              Get.toNamed('login');
            },
          ),
        ]),
      ),
    );
  }
}
