
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../utils/firebase.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff07635d),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 26.h,
                width: 50.w,
                decoration: const BoxDecoration(
                  // color: Colors.amber,
                  image: DecorationImage(
                      image: AssetImage("assets/images/Ellipse 3.png"),
                      fit: BoxFit.contain),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 100),
              child: Text(
                "Create",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 140),
              child: Text(
                "Account",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 22.h),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 25),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: "Name",
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                    child: TextField(
                      controller: txtemail,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hoverColor: Colors.white,
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                    child: TextField(
                      obscureText: true,
                      controller: txtpassword,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20, right: 20, top: 25),
                  //   child: TextField(
                  //     obscureText: true,
                  //     style: TextStyle(color: Colors.white),
                  //     decoration: InputDecoration(
                  //       border: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.white)),
                  //       focusedBorder: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.white)),
                  //       enabledBorder: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.white)),
                  //       labelText: "Confirm Password",
                  //       labelStyle: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(onTap: () async {
                    var email = txtemail.text;
                    var password = txtpassword.text;

                    var msg = await FirebaseHelper.firehelper.createaccount(email, password);
                    Get.offAllNamed('login');
                    Get.snackbar(msg, 'Registration Success',colorText: msg==null?Colors.red:Colors.black);
                    // Get.offAllNamed('finger');
                  },
                    child: Container(
                      height: 7.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                          color: Color(0xffff7a30),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () async {
                          var msg = await FirebaseHelper.firehelper.geustanonymons();
                          if(msg == "Success")
                          {
                            Get.offAllNamed('finger');
                          }
                          Get.snackbar(msg, 'Success',colorText: msg==null?Colors.red:Colors.black);
                        },
                        child: Container(
                          height: 7.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffDADADA),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.person, color: Color(0xff2D2B2B)),
                        ),
                      ),
                      Container(
                        height: 7.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: const Color(0xffDADADA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.g_mobiledata_outlined,
                          color: Color(
                            0xff2D2B2B,
                          ),
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 715),
              child: Container(
                height: 7.h,
                width: 100.w,
                color: Color(0xffff7a30),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/');
                      },
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(color: Color(0xff07635d)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
