import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:todoapp/app/components/text-input.dart';
import 'package:todoapp/app/screens/authentication/register.dart';
import 'package:todoapp/app/service/firebase_auth_methods.dart';
import 'package:todoapp/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _onRegister() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }

  void _onLogin() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    await FirebaseAuthMethods().signInWithEmail(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      context: context,
    );
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  void _googleLogin() {}

  void _appleLogin() {}

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
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Lato-Bold',
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextInputWidget(
                      controller: _emailController,
                      label: 'Username',
                      placeholder: 'Enter your Username',
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextInputWidget(
                      controller: _passwordController,
                      label: 'Password',
                      placeholder: 'Enter your Password',
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    ElevatedButton(
                      onPressed: _onLogin,
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor:
                              const Color.fromRGBO(136, 117, 255, 1),
                          textStyle: const TextStyle(
                            fontFamily: 'Lato-Regular',
                            fontSize: 16,
                          )),
                      child: const Text('Login'),
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
                      onPressed: _googleLogin,
                      icon: const Icon(
                        FontAwesome5.google,
                        color: Colors.red,
                      ),
                      label: const Text(
                        'Login with Google',
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
                      onPressed: _appleLogin,
                      icon: Center(
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            FontAwesome5.apple,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      label: const Text(
                        'Login with Apple',
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
                            "Don't have an account?",
                            style: TextStyle(
                              fontFamily: 'Lato-Regular',
                              fontSize: 12,
                              color: Color.fromRGBO(151, 151, 151, 1),
                            ),
                          ),
                          TextButton(
                              onPressed: _onRegister,
                              style: TextButton.styleFrom(
                                minimumSize: const Size(1, 1),
                              ),
                              child: const Text(
                                'Register',
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
