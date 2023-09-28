import 'package:flutter/material.dart';
import 'package:flutter_mood/authentication/repos/authentication_repo.dart';
import 'package:flutter_mood/postMood/view_models/mood_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class PostScreen extends ConsumerStatefulWidget {
  static String routeName = "post";
  static String routeURL = "/post";
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<PostScreen> {
  String formatDate = DateFormat('yy/MM/dd - HH:mm:ss').format(DateTime.now());

  final TextEditingController _contentController = TextEditingController();
  late String content;
  late String mood;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contentController.addListener(() {
      setState(() {
        content = _contentController.value.text;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(236, 231, 194, 1),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'How do you feel?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    width: 340,
                    height: 200,
                    child: TextField(
                      controller: _contentController,
                      cursorHeight: 15,
                      cursorColor: Colors.transparent,
                      maxLines: 5,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Write it down here!",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'What\'s your mood ?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          mood = '\u{1F601}';
                        },
                        child: const Text(
                          '\u{1F601}',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          mood = '\u{1F618}';
                        },
                        child: const Text(
                          '\u{1F618}',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '\u{1F61E}',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '\u{1F62D}',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '\u{1F622}',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '\u{1F621}',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
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
                      ref.watch(moodProvider.notifier).createMood(
                          ref.read(authRepo).user!.uid,
                          mood,
                          content,
                          formatDate);
                    },
                    child: const Text(
                      'Post',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
