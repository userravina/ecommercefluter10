import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefluter10/model/ecommerce_model.dart';
import 'package:ecommercefluter10/utils/notification_permistion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseHelper {
  static final FirebaseHelper firehelper = FirebaseHelper._();
  var uid;

  FirebaseHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //================================ authetiction ========================

  Future<String> geustanonymons() async {
    try {
      await auth.signInAnonymously();
      return "Success";
    } catch (e) {
      return "$e";
    }
  }

  Future<String> createaccount(email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Success";
    } catch (e) {
      return "$e";
    }
  }

  Future<String> loginemailpassword(email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } catch (e) {
      return "$e";
    }
  }

  bool checkuser() {
    User? user = auth.currentUser;
    return user != null;
  }

  Future<UserCredential> googleLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // ignore: non_constant_identifier_names
  Future<void> user_logout() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }

  Map<String, String?> readUser() {
    User? user = auth.currentUser;
    return {
      'email': user!.email,
      'name': user.displayName,
      'photo': user.photoURL,
      'uid': user.uid,
    };
  }

  //======================= firestore database =========================

  void inserData(Model_ecommerce model) {
    firestore.collection("product").add({
      "Name": model.Name,
      "decount": model.decount,
      "Price": model.Price,
      "Category": model.cate,
      "Image": model.Img,
      "description": model.desc,
      'ic': model.ic
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readfirestore() {
    return firestore.collection("product").snapshots();
  }

  Future<void> deleteData(id) {
    return firestore.collection("product").doc(id).delete();
  }

  Future<void> updatedata(Model_ecommerce model) {
    return firestore.collection("product").doc(model.id).set({
      "Name": model.Name,
      "Price": model.Price,
      "decount": model.decount,
      "Category": model.cate,
      "Image": model.Img,
      "description": model.desc,
    });
  }

  // cart write and read

  Future<void> cartUpdate(Model_ecommerce model) {
    return firestore
        .collection("cart")
        .doc(uid)
        .collection("cartproduct")
        .doc("${model.ic}")
        .set({
      "Name": model.Name,
      "Price": model.Price,
      "description": model.desc,
      "Category": model.cate,
      "decount": model.decount,
      "Image": model.Img,
      'ic': model.ic,
    });
  }

  Future<String?> cartProduct(Model_ecommerce model) async {
    firestore.collection("cart").doc("$uid").collection("cartproduct").add({
      "Name": model.Name,
      "Price": model.Price,
      "description": model.desc,
      "Category": model.cate,
      "decount": model.decount,
      "Image": model.Img,
      'ic': model.ic,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> cartRead() {
    return firestore
        .collection("cart")
        .doc("$uid")
        .collection("cartproduct")
        .snapshots();
  }

  Future<void> cartdeleteData(id) async {
    await firestore
        .collection("cart")
        .doc("$uid")
        .collection("cartproduct")
        .doc(id)
        .delete();
  }

  void clearCart(List<Model_ecommerce> productLists) {
    bool ui = checkuser();
    for (int i = 0; i < productLists.length; i++) {
      firestore
          .collection("cart")
          .doc("$uid")
          .collection("cartproduct")
          .doc(productLists[i].id)
          .delete();
    }
  }

  //=========================== firebase messgeing =================

  Future<void> initMessageing() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print("Token :- ${fcmToken}");

    FirebaseMessaging.onMessage.listen((message) {
      var notifi = message.notification;

      if (notifi != null) {
        var title = notifi.title;
        var body = notifi.body;
        Notification_permision.service.firesideNotification(title, body);
      }
    });
  }
}
