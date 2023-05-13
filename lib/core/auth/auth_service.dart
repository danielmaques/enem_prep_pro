import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enem_prep_pro/core/auth/auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'user_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ValueNotifier<UserModel?> user = ValueNotifier(null);

  AuthService(AuthUseCase authUseCase);

  Future<void> signUpWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      // Criar usuário no Firebase Authentication
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? currentUser = userCredential.user;
      if (currentUser != null) {
        await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).set({
          'email': currentUser.email,
          'name': name,
        });

        user.value = UserModel(
          id: currentUser.uid,
          email: currentUser.email!,
          name: name,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during sign up: $e');
      }
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? currentUser = userCredential.user;
      if (currentUser != null) {
        user.value = UserModel(
          id: currentUser.uid,
          email: currentUser.email!,
          name: currentUser.displayName ?? '',
        );
        final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(currentUser.uid)
                .get();

        if (userSnapshot.exists) {
          final userData = userSnapshot.data();
          user.value = UserModel(
            id: currentUser.uid,
            email: currentUser.email!,
            name: userData!['name'],
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during sign in: $e');
      }
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        final User? currentUser = userCredential.user;
        if (currentUser != null) {
          user.value = UserModel(
            id: currentUser.uid,
            email: currentUser.email!,
            name: currentUser.displayName!,
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during sign in with Google: $e');
      }
    }
  }

  Future<UserModel?> getUserData() async {
    try {
      final User? currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(currentUser.uid)
                .get();

        if (userSnapshot.exists) {
          final userData = userSnapshot.data();
          return UserModel(
            id: currentUser.uid,
            email: currentUser.email!,
            name: userData!['name'],
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting user data: $e');
      }
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      user.value = null;
    } catch (e) {
      if (kDebugMode) {
        print('Error during sign out: $e');
      }
    }
  }
}
