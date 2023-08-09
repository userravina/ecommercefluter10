import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefluter10/Controller/ecommerce_controler.dart';
import 'package:ecommercefluter10/Screen/user_side/payment/razorpay.dart';
import 'package:ecommercefluter10/model/ecommerce_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../utils/firebase.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  ecommerce_controller controller = Get.put(ecommerce_controller());

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "My order",
                        style: GoogleFonts.alice(
                            fontSize: 20,
                            letterSpacing: 1,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  StreamBuilder(
                    stream: FirebaseHelper.firehelper.cartRead(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else if (snapshot.hasData) {
                        QuerySnapshot qs = snapshot.data!;
                        List<QueryDocumentSnapshot> qList = qs.docs;
                        controller.cartList = [];

                        for (var x in qList) {
                          Map? data = x.data() as Map;
                          String? id = x.id;
                          String? name = data['Name'];
                          String? desc = data['description'];
                          String? cate = data['Category'];
                          int? price = data['Price'];
                          String? img = data['Image'];
                          String? descount = data['decount'];
                          int? ic = data['ic'];
                          controller.subtotal.value =
                              controller.subtotal.value +
                                  (price! * controller.number.value);
                          Model_ecommerce t1 = Model_ecommerce(
                              Price: price,
                              Name: name,
                              desc: desc,
                              Img: img,
                              cate: cate,
                              decount: descount,
                              ic: ic,
                              id: id);

                          controller.cartList.add(t1);
                        }
                        return SizedBox(
                          height: 54.h,
                          child: NotificationListener<
                              OverscrollIndicatorNotification>(
                            onNotification:
                                (OverscrollIndicatorNotification overscroll) {
                              overscroll.disallowIndicator();
                              return true;
                            },
                            child: ListView.builder(
                              itemCount: controller.cartList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    height: 15.h,
                                    width: 100.w,
                                    margin:
                                    EdgeInsets.symmetric(vertical: 1.5.h),
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 2.w),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(3.w),
                                        //color: Colors.amberAccent.shade100,
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0xffE5E5E5),
                                            offset: Offset(0, 5),
                                            blurRadius: 8,
                                          )
                                        ]),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 12.h,
                                          width: 11.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(4.w),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${controller
                                                          .cartList[index]
                                                          .Img}"),
                                                  fit: BoxFit.contain)),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        SizedBox(
                                          width: 35.w,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Text(
                                                "${controller.cartList[index]
                                                    .Name}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14.sp),
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Text(
                                                "${controller.cartList[index]
                                                    .desc}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.grey.shade900,
                                                    fontSize: 11.sp),
                                                maxLines: 2,
                                              ),
                                              const Spacer(),
                                              SizedBox(
                                                height: 1.h,
                                              )
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ));
                              },
                            ),
                          ),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text("₹${controller.subtotal.value}",
                            style:
                                const TextStyle(fontSize: 20, color: Colors.black)),
                      ],
                    ),
                  ),
                  Container(
                    height: 13.5.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
                        color: Colors.white,
                        border: Border.all(color: Colors.black12)),
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 2.h),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      AlertDialog(
                        alignment: Alignment.center,
                        title: GestureDetector(
                          onTap: () {
                            Get.offAllNamed("bottom");
                            PaymentHelper.payment.setPayment(20);
                            FirebaseHelper.firehelper
                                .clearCart(controller.tempList);
                          },
                          child: Container(
                            height: 6.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.w),
                              color: const Color(0xff07635d),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Go For Payment",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        Get.offAllNamed("bottom");
                        PaymentHelper.payment.setPayment(20);
                        FirebaseHelper.firehelper
                            .clearCart(controller.tempList);
                      },
                      child: Container(
                        height: 6.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.w),
                          color: const Color(0xff07635d),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Go For Payment",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
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
