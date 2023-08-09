
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefluter10/Controller/ecommerce_controler.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../model/ecommerce_model.dart';

// ignore: camel_case_types
class searchscreen extends StatefulWidget {
  const searchscreen({super.key});

  @override
  State<searchscreen> createState() => _searchscreenState();
}

// ignore: camel_case_types
class _searchscreenState extends State<searchscreen> {
  List searchList =[];
  List resultsearch=[];
  String? id ,name ,desc ,cate  ,img , descount;
  int? price;
  TextEditingController txtsearch = TextEditingController();
  @override
  void initState() {
    txtsearch.addListener(serachChange);
    super.initState();
  }
  serachChange()
  {
    result();
  }

  result()
  {
    var showresult = [];
    if(txtsearch.text != '')
      {
         for(var product in searchList)
           {
             var cate = product['Category'].toString().toLowerCase();
             if(cate.contains(txtsearch.text.toLowerCase()))
               {
                 showresult.add(product);
               }
           }
      }
    else
      {
        showresult = List.from(searchList);
      }
    setState(() {
      resultsearch = showresult;
    });
  }
  getsearch() async{
    var data = await FirebaseFirestore.instance.collection('product').orderBy('Category').get();

    setState(() {
      searchList = data.docs;
      for(var x in searchList)
        {
          Map? data = x.data() as Map;
          id = x.id;
         name = data['Name'];
         desc = data['description'];
         cate = data['Category'];
         price = data['Price'];
          img = data['Image'];
          descount = data['decount'];
        }
    });
    result();
  }
  ecommerce_controller controller = ecommerce_controller();

@override
  void didChangeDependencies() {
  getsearch();
    super.didChangeDependencies();
  }
  @override
  void dispose() {
   txtsearch.removeListener(serachChange);
   txtsearch.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                child: Container(
                  height: 6.h,
                  width: 97.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.teal.shade500, blurRadius: 4)
                      ]),
                  child: Center(
                    child:TextField(
                      controller: txtsearch,
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
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 80.h,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Model_ecommerce t1 = Model_ecommerce(
                                 Price: price,
                                Name: name,
                                 desc: desc,
                                Img: img,
                                cate: cate,
                                 decount: descount,
                                 id: id
                            );
                            resultsearch.add(t1);
                            Navigator.pushNamed(context, 'view',
                                arguments: t1);
                          },
                          child: Padding(padding: const EdgeInsets.all(1),
                            child: ListTile(
                              leading: SizedBox(
                                  width: 50,
                                  child: Image.network(
                                    "${resultsearch[index]['Image']}",
                                  )),
                              subtitle: Text(
                                "${resultsearch[index]['Category']}",
                                style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 13),
                              ),
                              title: Text(
                                "${resultsearch[index]['Name']}",
                                style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                  itemCount: resultsearch.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
