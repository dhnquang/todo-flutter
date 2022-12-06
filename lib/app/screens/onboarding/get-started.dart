import 'package:flutter/material.dart';
import 'package:todoapp/app/screens/authentication/login.dart';
import 'package:todoapp/app/screens/authentication/register.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  void _onLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const LoginScreen()),
    );
  }

  void _onRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios),),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            const SizedBox(height: 58),
            Expanded(
              child: Column(
                children: const <Widget>[
                  Text(
                    'Welcome to UpTodo',
                    style: TextStyle(
                        fontFamily: 'Lato-Bold',
                        fontSize: 32,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 26),
                  SizedBox(
                    width: 287,
                    child: Text(
                      'Please login to your account or create new account to continue',
                      style: TextStyle(
                          fontFamily: 'Lato-Regular',
                          fontSize: 16,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _onLogin,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: const Color.fromRGBO(136, 117, 255, 1),
                        textStyle: const TextStyle(
                          fontFamily: 'Lato-Regular',
                          fontSize: 16,
                        )
                    ),
                    child: const Text('LOGIN'),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _onRegister,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        side: const BorderSide(
                          color: Color.fromRGBO(136, 117, 255, 1),
                          width: 1,
                        ),
                        textStyle: const TextStyle(
                          fontFamily: 'Lato-Regular',
                          fontSize: 16,
                        )
                    ),
                    child: const Text('CREATE ACCOUNT'),
                  ),
                  const SizedBox(height: 67)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
