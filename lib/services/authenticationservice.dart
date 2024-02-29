import 'package:aldmictest/screens/home/navigation.dart';
import 'package:aldmictest/screens/loginpage/loginapage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class AuthenticationService extends GetxController {
  static AuthenticationService get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    pindahHalaman();
  }

  pindahHalaman() async {
    final user = _auth.currentUser;
    if (user != null) {
      Get.offAll(() => const Navigation());
    } else {
      Get.offAll(() => const LoginPage());
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const LoginPage());
  }

  Future<UserCredential> logIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw 'something went wrong';
    }
  }
}
