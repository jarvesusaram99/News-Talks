import 'package:flutter/material.dart';
import 'package:flutter_news/auth/google_sign_in.dart';
import 'package:flutter_news/view/screens/main_page.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';

class Authentication extends StatefulWidget {
  Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final box = Hive.box('box');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                child: Lottie.asset('assets/69292-news.json'),
              ),
              Container(
                width: 200,
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(207, 65, 122, 107),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'pop'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                child: const Text(
                  'Find the\n real stories',
                  style: TextStyle(
                      fontSize: 36,
                      color: Color(0xff24604F),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'pop'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.off(() => const Home());
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Skip',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(207, 65, 122, 107),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'pop')),
                        height: 40,
                        width: 80,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              signInWithGoogle().then((result) {
                                if (result != null) {
                                  String username = result.displayName != null
                                      ? result.displayName!
                                      : "User";
                                  String userPichure = result.photoURL != null
                                      ? result.photoURL!
                                      : "https://cdn.imgbin.com/3/12/17/imgbin-computer-icons-avatar-user-login-avatar-man-wearing-blue-shirt-illustration-mJrXLG07YnZUc2bH5pGfFKUhX.jpg";
                                  // print(userPichure);
                                  box.put('userName', username);
                                  box.put('profilePhoto', userPichure);

                                  // print(result.displayName);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const Home();
                                      },
                                    ),
                                  );
                                }
                              });
                            },
                            child: Container(
                              // width: 400,
                              height: 40,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(207, 65, 122, 107),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  "Signin With Google ",
                                  style: const TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                      // decoration: BoxDecoration(
                      //     //
                      //     color: Color.fromARGB(207, 65, 122, 107)),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
