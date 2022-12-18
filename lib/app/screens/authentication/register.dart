import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:todoapp/app/components/text-input.dart';
import 'package:todoapp/app/service/firebase_auth_methods.dart';

import 'package:todoapp/main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  void _onRegister() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
    await FirebaseAuthMethods().signUpWithEmail(
      email: _emailController.text,
      password: _passwordController.text,
      context: context,
    );
    // navigatorKey.currentState!.popUntil((route) => route.isActive);
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
        child: Form(
          key: formKey,
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
                    TextInputWidget(
                      label: 'Username',
                      placeholder: 'Enter your Username',
                      controller: _emailController,
                      obscureText: false,
                      validate: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null,
                    ),
                    TextInputWidget(
                      label: 'Password',
                      placeholder: 'Enter your Password',
                      controller: _passwordController,
                      obscureText: true,
                      validate: (password) =>
                          password != null && password.length < 6
                              ? 'Enter min 6 characters'
                              : null,
                    ),
                    TextInputWidget(
                      label: 'Confirm',
                      placeholder: 'Re-Enter your Password',
                      controller: _confirmPasswordController,
                      obscureText: true,
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
                          color: Color.fromRGBO(255, 255, 255, 0.87),
                        ),
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
                          color: Color.fromRGBO(255, 255, 255, 0.87),
                        ),
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
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
