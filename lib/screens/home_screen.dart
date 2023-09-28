import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mood/authentication/repos/authentication_repo.dart';
import 'package:flutter_mood/authentication/view_models/signin_view_model.dart';
import 'package:flutter_mood/postMood/models/mood_model.dart';
import 'package:flutter_mood/postMood/repos/mood_repo.dart';
import 'package:flutter_mood/postMood/view_models/mood_view_model.dart';
import 'package:flutter_mood/screens/post_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String routeName = "home";
  static String routeURL = "/home";
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(moodRepo).getMood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(236, 231, 194, 1),
      body: Center(
          child: Column(
        children: [
          Text(
            '${ref.watch(authRepo).user!.email!} 님 환영합니다!',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: ref.read(moodRepo).getMood(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data != null) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: GestureDetector(
                            onLongPress: () {
                              showCupertinoDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                  title: const Text('Mood Remove'),
                                  content: const Text('기분을 삭제하시겠습니까?'),
                                  actions: [
                                    CupertinoDialogAction(
                                        onPressed: () {
                                          ref.watch(moodRepo).removeMood(index);
                                          setState(() {});
                                        },
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        )),
                                    CupertinoDialogAction(
                                      child: const Text(
                                        'No',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 350,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.teal,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 3,
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 5.0,
                                          spreadRadius: 0.0,
                                          offset: Offset(0, 5),
                                        ),
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Mood : ${snapshot.data![index]['mood']}',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(snapshot.data![index]['content'],
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  snapshot.data![index]['posttime'],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                }
                if (snapshot.data == null) {
                  return const Text('No data');
                }
                return const SizedBox();
              })
        ],
      )),
    );
  }
}
