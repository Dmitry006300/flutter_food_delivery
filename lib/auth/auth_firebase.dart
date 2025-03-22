import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthFirebaseService {

//  get instance firebase auth
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// get current user
User? getCurrentUser(){
  return _firebaseAuth.currentUser;
}
//  signIn
Future<UserCredential> signInWithEmailPassword(String email, String password) async {
  try {
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email, 
      password: password
      );
    return userCredential;
  } on FirebaseAuthException catch (e) {
    throw Exception('Failed to sign in: $e \n code = ${e.code}');
  }
}

//  signUp
Future<UserCredential> signUpWithEmailPassword(String email, String password) async {
  try {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, 
      password: password
      );
    return userCredential;
  } on FirebaseAuthException catch (e) {
    throw Exception('Failed to sign in: $e \n code = ${e.code}');
  }
}

//  signOut
Future<void> signOut () async {
  return await _firebaseAuth.signOut();
  }
}