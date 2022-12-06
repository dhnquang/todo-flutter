import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:todoapp/app/service/firebase_auth_methods.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void _onRegister() {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'Lato-Bold',
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Username',
                            style: TextStyle(
                              fontFamily: 'Lato-Regular',
                              fontSize: 16,
                              color: Color.fromRGBO(255, 255, 255, 0.87),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: emailController,
                          style: const TextStyle(
                            fontFamily: 'Lato-Regular',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(151, 151, 151, 1),
                              )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(151, 151, 151, 1),
                                ),
                              ),
                              hintText: 'Enter your Username',
                              hintStyle: TextStyle(
                                fontFamily: 'Lato-Regular',
                                fontSize: 16,
                                color: Color.fromRGBO(83, 83, 83, 1),
                              )),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Password',
                            style: TextStyle(
                              fontFamily: 'Lato-Regular',
                              fontSize: 16,
                              color: Color.fromRGBO(255, 255, 255, 0.87),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: passwordController,
                          style: const TextStyle(
                            fontFamily: 'Lato-Regular',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(151, 151, 151, 1),
                              )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(151, 151, 151, 1),
                                ),
                              ),
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(
                                fontFamily: 'Lato-Regular',
                                fontSize: 16,
                                color: Color.fromRGBO(83, 83, 83, 1),
                              )),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Username',
                            style: TextStyle(
                              fontFamily: 'Lato-Regular',
                              fontSize: 16,
                              color: Color.fromRGBO(255, 255, 255, 0.87),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            fontFamily: 'Lato-Regular',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(151, 151, 151, 1),
                              )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(151, 151, 151, 1),
                                ),
                              ),
                              hintText: 'Enter your Username',
                              hintStyle: TextStyle(
                                fontFamily: 'Lato-Regular',
                                fontSize: 16,
                                color: Color.fromRGBO(83, 83, 83, 1),
                              )),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: _onRegister,
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor:
                              const Color.fromRGBO(136, 117, 255, 1),
                          textStyle: const TextStyle(
                            fontFamily: 'Lato-Regular',
                            fontSize: 16,
                          )),
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Text(
                          'or',
                          style: TextStyle(
                            fontFamily: 'Lato-Regular',
                            fontSize: 16,
                            color: Color.fromRGBO(151, 151, 151, 1),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesome5.google,
                        color: Colors.red,
                      ),
                      label: const Text(
                        'Register with Google',
                        style: TextStyle(
                            fontFamily: 'Lato-Regular',
                            fontSize: 16,
                            color: Color.fromRGBO(255, 255, 255, 0.87)),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        side: const BorderSide(
                          color: Color.fromRGBO(136, 117, 255, 1),
                          width: 1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesome5.apple,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Register with Apple',
                        style: TextStyle(
                            fontFamily: 'Lato-Regular',
                            fontSize: 16,
                            color: Color.fromRGBO(255, 255, 255, 0.87)),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        side: const BorderSide(
                          color: Color.fromRGBO(136, 117, 255, 1),
                          width: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontFamily: 'Lato-Regular',
                              fontSize: 12,
                              color: Color.fromRGBO(151, 151, 151, 1),
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                minimumSize: const Size(1, 1),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Lato-Regular',
                                  fontSize: 12,
                                  color: Color.fromRGBO(255, 255, 255, 0.87),
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
