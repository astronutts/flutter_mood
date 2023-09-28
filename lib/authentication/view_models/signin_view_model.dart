// ignore_for_file: avoid_print

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mood/authentication/repos/authentication_repo.dart';
import 'package:flutter_mood/screens/main_navigation_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;

  User? get user => _repository.user;

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  Future<void> signin(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _repository.signin(
        email,
        password,
      ),
    );
    if (state.hasError) {
      print(state.error);
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MainNavigationScreen()));
    }
  }
}

final signinProvider = AsyncNotifierProvider<SignInViewModel, void>(
  () => SignInViewModel(),
);
