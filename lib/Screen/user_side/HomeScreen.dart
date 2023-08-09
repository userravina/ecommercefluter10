import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefluter10/Controller/ecommerce_controler.dart';
import 'package:ecommercefluter10/model/ecommerce_model.dart';
import 'package:ecommercefluter10/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../utils/notification_permistion.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ecommerce_controller controller = Get.put(ecommerce_controller());

  Map mapData = {};

  @override
  void initState() {
    mapData = FirebaseHelper.firehelper.readUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          elevation: 0,
          title: Text(
            "15/2 New Texas",
            style: GoogleFonts.farro(fontSize: 15, color: Colors.black87),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black54,
                  size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Notification_permision.service.ShowNotification();
                Get.toNamed('noti');
              },
              child: Icon(
                Icons.notifications,
                color: Colors.grey.shade700,
                size: 30,
              ),
            ),
            InkWell(
              onTap: () {
                Notification_permision.service.Timenotification();
              },
              child: Icon(
                Icons.timer,
                color: Colors.grey.shade700,
                size: 30,
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              width: 9,
            ),
          ],
        ),
        drawer: Drawer(
          // backgroundColor: const Color(0xFF1C2833),
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff07635d),
                ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xff07635d),
                  ),
                  accountName: Text(
                    "Ravina Baldaniya",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("Ravina999@gmail.com"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: Padding(
                    padding: EdgeInsets.only(),
                    child: CircleAvatar(
                      backgroundColor: Colors.deepOrangeAccent,
                      child: Text(
                        "R",
                        style: TextStyle(fontSize: 30.0, color: Colors.black),
                      ), //Text
                    ),
                  ), //circleAvatar
                ), //UserAccountDrawerHeader
              ), //DrawerHeader
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
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                      height: 6.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.teal.shade500, blurRadius: 4)
                          ]),
                      child: Center(
                        child: TextField(
                          onTap: () {
                            Get.toNamed('serach');
                          },
                          cursorColor: Colors.grey.shade600,
                          decoration: const InputDecoration(
                            hintText: "Search..",
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 9.h,
                      width: 15.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Home_icon.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Recent Searches",
                      style: GoogleFonts.alexandria(
                          fontSize: 20, color: Colors.black87),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Explore",
                          style: GoogleFonts.alexandria(
                              fontSize: 18, color: Colors.black87),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Popular",
                          style: GoogleFonts.alexandria(
                              fontSize: 14, color: Colors.black54),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Newest Deals",
                          style: GoogleFonts.alexandria(
                              fontSize: 14, color: Colors.black54),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "High ratings",
                          style: GoogleFonts.alexandria(
                              fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 57.h,
                  child: StreamBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else if (snapshot.hasData) {
                        QuerySnapshot qs = snapshot.data!;
                        List qsList = qs.docs;
                        // ignore: non_constant_identifier_names
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
                          int? ic = data['ic'];

                          Model_ecommerce t1 = Model_ecommerce(
                              Price: price,
                              Name: name,
                              desc: desc,
                              Img: img,
                              cate: cate,
                              decount: descount,
                              id: id,
                            ic: ic
                          );

                          controller.ProductList.add(t1);
                        }
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, mainAxisExtent: 36.h),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {

                                  Model_ecommerce m =  Model_ecommerce(
                                    Name: controller.ProductList[index].Name,
                                    Price: controller.ProductList[index].Price,
                                    cate: controller.ProductList[index].cate,
                                    Img: controller.ProductList[index].Img,
                                    desc: controller.ProductList[index].desc,
                                    id: controller.ProductList[index].id,
                                    ic: 1,
                                  );

                                  Get.toNamed('view',
                                      arguments: m);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 24.h,
                                        width: 43.w,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                    onLongPress: () {
                                                      setState(() {
                                                        controller.favoritelist
                                                            .remove(controller
                                                                .ProductList[
                                                                    index]
                                                                .id
                                                                .toString());
                                                        // ignore: list_remove_unrelated_type
                                                        controller.flist.remove(
                                                            controller
                                                                .ProductList[
                                                                    index]
                                                                .id);
                                                      });
                                                    },
                                                    onTap: () {
                                                      setState(() {
                                                        controller.favoritelist
                                                            .add(controller
                                                                .ProductList[
                                                                    index]
                                                                .id
                                                                .toString());
                                                        controller.flist.add(
                                                            Model_ecommerce(
                                                          id: controller
                                                              .ProductList[
                                                                  index]
                                                              .id,
                                                          Img: controller
                                                              .ProductList[
                                                                  index]
                                                              .Img,
                                                          cate: controller
                                                              .ProductList[
                                                                  index]
                                                              .cate,
                                                          Name: controller
                                                              .ProductList[
                                                                  index]
                                                              .Name,
                                                        ));
                                                        Get.toNamed('f');
                                                      });
                                                    },
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.teal.shade100,
                                                      // ignore: unrelated_type_equality_checks
                                                      child: Icon(
                                                        Icons.favorite,
                                                        color: controller
                                                                .favoritelist
                                                                .contains(controller
                                                                    .ProductList[
                                                                        index]
                                                                    .id
                                                                    .toString())
                                                            ? Colors.red
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                ]),
                                            SizedBox(
                                              height: 120,
                                              width: 110,
                                              child: Image.network(
                                                "${controller.ProductList[index].Img}",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            "${controller.ProductList[index].Name}",
                                            style:
                                                GoogleFonts.mada(fontSize: 15),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "₹${controller.ProductList[index].Price}",
                                            style:
                                                GoogleFonts.mada(fontSize: 15),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            "${controller.ProductList[index].cate}",
                                            style:
                                                GoogleFonts.mada(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            "${controller.ProductList[index].decount}",
                                            style:
                                                GoogleFonts.mada(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: controller.ProductList.length);
                      }
                      return const CircularProgressIndicator(
                        color: Colors.teal,
                      );
                    },
                    stream: FirebaseHelper.firehelper.readfirestore(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
