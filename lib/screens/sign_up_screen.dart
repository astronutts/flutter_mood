import 'package:flutter/material.dart';
import 'package:flutter_mood/authentication/view_models/signup_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sign_in_screen.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static String routeName = "signup";
  static String routeURL = "/signup";
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _email = "";
  String _password = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.value.text;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.value.text;
      });
    });
  }

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
                'Join!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              const SizedBox(
                height: 30,
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
                  child: TextField(
                    controller: _emailController,
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
                  child: TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      focusColor: Colors.white,
                      hintText: "Password",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
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
                      ref.watch(signupForm.notifier).state = {
                        "email": _email,
                        "password": _password,
                      };
                      ref.watch(signupProvier.notifier).signup(context);
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
                          builder: ((context) => const SignUpScreen()),
                        ),
                      );
                    },
                    child: const Text(
                      'Log in',
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
