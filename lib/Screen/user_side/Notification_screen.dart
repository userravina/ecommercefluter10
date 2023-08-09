import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefluter10/Controller/ecommerce_controler.dart';
import 'package:ecommercefluter10/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../model/ecommerce_model.dart';

// ignore: camel_case_types
class notificationscreen extends StatefulWidget {
  const notificationscreen({super.key});

  @override
  State<notificationscreen> createState() => _notificationscreenState();
}

// ignore: camel_case_types
class _notificationscreenState extends State<notificationscreen> {
  ecommerce_controller controller = ecommerce_controller();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Notification",
                style: GoogleFonts.alice(
                    fontSize: 20,
                    letterSpacing: 1,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
            ],),
            const SizedBox(
              height: 15,
            ),
            StreamBuilder(
              builder: (context, snapshot) {

                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  QuerySnapshot qs = snapshot.data!;
                  List qsList = qs.docs;
                  controller.ProductList = [];

                  for (var x in qsList) {
                    Map? data = x.data() as Map;
                    String? id = x.id;
                    String? name = data['Name'];
                    String? desc = data['description'];
                    String? cate = data['Category'];
                    int? price = data['Price'];
                    String? img = data['Image'];
                    String? descount = data['decount'];

                    Model_ecommerce t1 = Model_ecommerce(
                        Price: price,
                        Name: name,
                        desc: desc,
                        Img: img,
                        cate: cate,
                        decount: descount,
                        id: id);

                    controller.ProductList.add(t1);
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              height: 139,
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Container(
                                      height: 90,
                                      width: 80,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                "${controller.ProductList[index].Img}",
                                              ),
                                              fit: BoxFit.fill))),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 5, bottom: 15
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.ProductList[index].cate}",
                                          style: GoogleFonts.mada(
                                              color: Colors.black, fontSize: 15),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        SizedBox(
                                          height: 10.h,width: 63.w,
                                          child: Text(
                                            "${controller.ProductList[index].desc}",
                                            style: GoogleFonts.mada(
                                                color: Colors.black, fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.shade400),
                          ],
                        );
                      },
                      itemCount: controller.ProductList.length,
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
              stream: FirebaseHelper.firehelper.readfirestore(),
            )
          ],
        ),
      )),
    );
  }
}
