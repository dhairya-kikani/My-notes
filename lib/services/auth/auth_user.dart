import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth show User;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


@immutable
class AuthUser {
final bool isEmailVerified;  
const AuthUser(this.isEmailVerified);

factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified);
}


 