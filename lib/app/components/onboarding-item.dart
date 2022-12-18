import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final String img;
  final String title;
  final String description;

  const OnboardingItem(
      {Key? key,
      required this.img,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 4,
          child: Image.asset(img),
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Lato-Bold',
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 299,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Lato-Regular',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
