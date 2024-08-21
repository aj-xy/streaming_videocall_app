import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:streaming_videocall_app/services/authservices.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  User? get user => _user;

  AuthProvider() {
    _authService.user.listen(_onAuthStateChanged);
  }

  Future<void> signIn(String email, String password) async {
    await _authService.signInWithEmailAndPassword(email, password);
  }

  Future<void> register(String email, String password) async {
    await _authService.registerWithEmailAndPassword(email, password);
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }

  void _onAuthStateChanged(User? user) {
    _user = user;
    notifyListeners();
  }
}
