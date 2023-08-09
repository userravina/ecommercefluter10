import 'package:ecommercefluter10/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 38.h,
              width: 100.w,
              decoration: const BoxDecoration(
                 // color: Colors.amber,
                image: DecorationImage(
                    image: AssetImage("assets/images/Group 1.png"),
                    fit: BoxFit.contain),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 100),
              child: Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 140),
              child: Text(
                "Back",
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
                  SizedBox(height: 35.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                    child: TextField(
                      controller: txtemail,
                      decoration: const InputDecoration(labelText: "Email"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                    child: TextField(
                      obscureText: true,
                      controller: txtpassword,
                      decoration: const InputDecoration(labelText: "Password"),
                    ),
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      var email = txtemail.text;
                      var password = txtpassword.text;

                      var msg = await FirebaseHelper.firehelper.loginemailpassword(email, password);
                      if(msg == "Success")
                      {
                        Get.offAllNamed('finger');
                      }
                      Get.snackbar(msg, 'login Success',colorText: msg==null?Colors.red:Colors.black);
                    },
                    child: Container(
                      height: 7.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                          color: const Color(0xff07635d),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "LOGIN",
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
                      InkWell(
                        onTap: () async {
                          var msg = await FirebaseHelper.firehelper.googleLogin();
                          if("$msg" == "Success")
                          {
                            Get.offAllNamed('finger');
                          }
                          Get.snackbar("$msg", 'Google login Success',colorText: msg==null?Colors.red:Colors.black);
                        },
                        child: Container(
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
                color: const Color(0xffff7a30),
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
                        Get.toNamed('Signup');
                      },
                      child: const Text(
                        "SIGN UP",
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
