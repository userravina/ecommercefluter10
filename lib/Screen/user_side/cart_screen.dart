import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefluter10/Controller/ecommerce_controler.dart';
import 'package:ecommercefluter10/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../model/ecommerce_model.dart';

// ignore: camel_case_types
class cartscreen extends StatefulWidget {
  const cartscreen({super.key});

  @override
  State<cartscreen> createState() => _cartscreenState();
}

// ignore: camel_case_types
class _cartscreenState extends State<cartscreen> {
  ecommerce_controller controller = ecommerce_controller();
  var ic;
@override
  void initState() {

    FirebaseHelper.firehelper.cartUpdate(Model_ecommerce(ic: ic));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Cart Product",
                  style: GoogleFonts.alice(
                      fontSize: 20,
                      letterSpacing: 1,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
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
                  print(controller.cartList.length);
                  controller.cartList = [];
                  for (var x in qsList) {
                    Map data = x.data();
                    String? id = x.id;
                    String? name = data['Name'];
                    String? desc = data['description'];
                    String? cate = data['Category'];
                    int? price = data['Price'];
                    String? img = data['Image'];
                    String? descount = data['decount'];
                    int? ic = data['ic'];
                    controller.subtotal.value = controller.subtotal.value +
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

                    print(ic);
                    controller.cartList.add(t1);
                  }
                  return SizedBox(
                    height: 50.h,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 110,
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                  height: 80,
                                  width: 70,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.cyan,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "${controller.cartList[index].Img}",
                                          ),
                                          fit: BoxFit.fill))),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 5, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.cartList[index].Name}",
                                      style: GoogleFonts.aBeeZee(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "${controller.cartList[index].cate}",
                                      style: GoogleFonts.aBeeZee(
                                          color: Colors.black, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "₹${controller.cartList[index].Price}",
                                      style: GoogleFonts.aBeeZee(
                                          color: Colors.black, fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        FirebaseHelper.firehelper
                                            .cartdeleteData(
                                                controller.cartList[index].id);
                                      },
                                      icon: Icon(
                                        Icons.close_rounded,
                                        size: 20,
                                        color: Colors.teal.shade900,
                                      )),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                           ic = controller.cartList[index].ic!;
                                          if (ic > 0) {
                                            ic--;
                                          }
                                           FirebaseHelper.firehelper.cartUpdate(Model_ecommerce(ic: ic));
                                          print(ic);
                                        },
                                        icon: Icon(
                                          Icons.remove_circle_outline_outlined,
                                          color: Colors.teal.shade900,
                                        ),
                                      ),
                                      Container(
                                        height: 21,
                                        width: 18,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${controller.cartList[index].ic}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.teal.shade900,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                           ic =
                                              controller.cartList[index].ic!;
                                          ic++;
                                           FirebaseHelper.firehelper.cartUpdate(Model_ecommerce(ic: ic));
                                          print(ic);
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline_outlined,
                                          color: Colors.teal.shade900,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: controller.cartList.length,
                    ),
                  );
                }
                return CircularProgressIndicator(
                  color: Colors.deepOrangeAccent.shade200,
                );
              },
              stream: FirebaseHelper.firehelper.cartRead(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text("₹${controller.subtotal.value}",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(color: Colors.black),
            Row(
              children: [
                Text("Order instructions", style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(color: Color(0xff07635d)),
                  borderRadius: BorderRadius.circular(25)),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'buy');
              },
              child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff07635d)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Buy",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))),
            ),
          ],
        ),
      )),
    );
  }
}
