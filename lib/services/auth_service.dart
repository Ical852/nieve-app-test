import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nieveapptest/functions/global_func.dart';
import 'package:nieveapptest/models/auth_response_model.dart';
import 'package:nieveapptest/models/user_detail_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<AuthResponseModel> signInWithEmailAndPassword({
    required String email,
    required String password
  }) async {
    try {
      var result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      
      var userData = null;
      await _firebaseFirestore.collection('users').doc(result.user!.uid).get().then((value) {
        var data = value.data()!;
        userData = data;
      });

      var userDetail = UserDetailModel(userData['fullName'], userData['phoneNumber']);
      var authResponse = AuthResponseModel(true, "Sign In Success", userDetail);

      return authResponse;
    } on FirebaseAuthException catch (e) {
      var authResponse = AuthResponseModel(false, e.message.toString(), null);
      return authResponse;
    }
  }

  Future<AuthResponseModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
  }) async {
    try {
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );

      _firebaseFirestore.collection('users').doc(result.user!.uid).set({
        "fullName": fullName,
        "phoneNumber": phoneNumber
      });

      var userDetail = UserDetailModel(fullName, phoneNumber);
      var authResponse = AuthResponseModel(true, "Sign Up Success", userDetail);

      return authResponse;
    } on FirebaseAuthException catch (e) {
      var authResponse = AuthResponseModel(false, e.message.toString(), null);
      return authResponse;
    }
  }

  Future<AuthResponseModel> changePassword({
    required String oldPassword,
    required String newPassword
  }) async {
    var result = false;
    String? message = "Change Password Failed";

    try {
      final cred = await EmailAuthProvider.credential(email: currentUser!.email!, password: oldPassword);
      await currentUser!.reauthenticateWithCredential(cred).then((value) async {
        await currentUser!.updatePassword(newPassword).then((_) {
          result = true;
          message = "Change Password Success";
        // ignore: argument_type_not_assignable_to_error_handler
        }).catchError((FirebaseAuthException onError) {
          result = false;
          message = onError.message;
        });
      // ignore: argument_type_not_assignable_to_error_handler
      }).catchError((FirebaseAuthException onError) {
        result = false;
        message = onError.message;
      });

      var authResponse = AuthResponseModel(result, message!, null);
      return authResponse;
    } on FirebaseAuthException catch (e) {
      var authResponse = AuthResponseModel(false, e.message.toString(), null);
      return authResponse;
    }
  }

  Future<UserDetailModel?> fetchUserData() async {
    try {
      var userData = null;
      await _firebaseFirestore.collection('users').doc(currentUser!.uid).get().then((value) {
        var data = value.data()!;
        userData = data;
      });

      var userDetail = UserDetailModel(userData['fullName'], userData['phoneNumber']);
      return userDetail;
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateUserData({
    required String fullName,
    required String phoneNumber
  }) async {
    try {
      _firebaseFirestore.collection('users').doc(currentUser!.uid).set({
        "fullName": fullName,
        "phoneNumber": phoneNumber
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}