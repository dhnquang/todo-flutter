import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({Key? key}) : super(key: key);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: 8,),
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
                  )
              ),
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
              )
          ),
        )
      ],
    );
  }
}