// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_mood/authentication/view_models/signin_view_model.dart';
import 'package:flutter_mood/screens/sign_up_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routeURL = "/";
  static const routeName = "signin";
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(236, 231, 194, 1),
        title: const Text(
          '\u{1F525} MOOD \u{1F525}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(236, 231, 194, 1),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 130,
              ),
              const Text(
                'Welcome!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          color: Colors.white,
                        ),
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value != null) {
                                formData['email'] = value;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              focusColor: Colors.white,
                              hintText: "Email",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          color: Colors.white,
                        ),
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value != null) {
                                formData['password'] = value;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              focusColor: Colors.white,
                              hintText: "Password",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                      offset: Offset(5, 3),
                    ),
                  ],
                  color: const Color.fromRGBO(253, 166, 246, 1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState != null) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ref.watch(signinProvider.notifier).signin(
                                formData["email"]!,
                                formData["password"]!,
                                context,
                              );
                          print(formData);
                        }
                      } else {
                        print('formkey error');
                      }
                    },
                    child: const Text(
                      'Enter',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 280,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                      offset: Offset(5, 3),
                    ),
                  ],
                  color: const Color.fromRGBO(253, 166, 246, 1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => const SignInScreen()),
                        ),
                      );
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
