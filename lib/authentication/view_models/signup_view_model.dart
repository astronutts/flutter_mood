// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mood/authentication/repos/authentication_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.watch(authRepo);
  }

  Future<void> signup(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signupForm);
    state = await AsyncValue.guard(
      () async => await _authRepo.signup(
        form["email"],
        form["password"],
      ),
    );
  }
}

final signupForm = StateProvider((ref) => {});
final signupProvier = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
