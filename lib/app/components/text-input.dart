import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final String label;
  final String placeholder;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validate;

  const TextInputWidget({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.controller,
    required this.obscureText,
    this.validate,
  }) : super(key: key);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            widget.label,
            style: const TextStyle(
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
          controller: widget.controller,
          obscureText: widget.obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validate,
          style: const TextStyle(
            fontFamily: 'Lato-Regular',
            fontSize: 16,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color.fromRGBO(151, 151, 151, 1),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color.fromRGBO(151, 151, 151, 1),
              ),
            ),
            hintText: widget.placeholder,
            hintStyle: const TextStyle(
              fontFamily: 'Lato-Regular',
              fontSize: 16,
              color: Color.fromRGBO(83, 83, 83, 1),
            ),
          ),
        )
      ],
    );
  }
}
