import 'package:flutter/material.dart';
import 'package:todoapp/app/screens/onboarding/get-started.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  _handlePage(int index) {
    setState(() {
      _page = index;
    });
  }

  void onBack() {
    if(_page != 0) {
      controller.previousPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut
      );
    }
  }

  void onNext() {
    if(_page != 2) {
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const GetStartedScreen()),
      );
    }
  }

  void onSkip() {
    if(_page !=2) {
      controller.jumpToPage(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 120),
        child: Stack(
          children: [
            PageView(
              physics: const ClampingScrollPhysics(),
              controller: controller,
              onPageChanged: (index) => _handlePage(index),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 4, child: Image.asset('lib/app/assets/images/onboarding1.png')),
                    Expanded(flex: 3, child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'Manage your tasks',
                          style: TextStyle(
                            fontFamily: 'Lato-Bold',
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 299,
                          child: Text(
                            'You can easily manage all of your daily tasks in DoMe for free',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lato-Regular',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ))

                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 4, child: Image.asset('lib/app/assets/images/onboarding2.png')),
                    Expanded(flex: 3, child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'Create daily routine',
                          style: TextStyle(
                            fontFamily: 'Lato-Bold',
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 299,
                          child: Text(
                            'In Uptodo  you can create your personalized routine to stay productive',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lato-Regular',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ))

                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 4, child: Image.asset('lib/app/assets/images/onboarding3.png')),
                    Expanded(flex: 3, child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'Organize your tasks',
                          style: TextStyle(
                            fontFamily: 'Lato-Bold',
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 299,
                          child: Text(
                            'You can organize your daily tasks by adding your tasks into separate categories',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lato-Regular',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ))

                  ],
                ),
              ],
            ),
            Positioned(
              top: 35,
              left: 24,
              child: TextButton(
                onPressed: onSkip,
                child: const Text(
                  'SKIP',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Lato-Regular',
                    color: Color.fromRGBO(255, 255, 255, 0.44)
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 120,
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 23,
                      height: 4,
                      decoration: BoxDecoration(
                        color: (_page == 0 ? const Color.fromRGBO(255, 255, 255, 0.87) : Colors.grey),
                        borderRadius: const BorderRadius.all(Radius.circular(56)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8,0,8,0),
                      child: Container(
                        width: 23,
                        height: 4,
                        decoration: BoxDecoration(
                          color: (_page == 1 ? const Color.fromRGBO(255, 255, 255, 0.87) : Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(56)),
                        ),
                      ),
                    ),
                    Container(
                      width: 23,
                      height: 4,
                      decoration: BoxDecoration(
                        color: (_page == 2 ? const Color.fromRGBO(255, 255, 255, 0.87) : Colors.grey),
                        borderRadius: const BorderRadius.all(Radius.circular(56)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        color: Colors.black,
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: onBack,
              child: const Text(
                'BACK',
                style: TextStyle(
                  fontFamily: 'Lato-Regular',
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 0.44),
                ),
              )
            ),
            ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(136, 117, 255, 1),
                padding: const EdgeInsets.fromLTRB(24,12,24,12),
                textStyle: const TextStyle(
                  fontFamily: 'Lato-Regular',
                  fontSize: 16,
                )
              ),
              child: Text((_page == 2 ? 'GET STARTED' : 'NEXT')),
            ),
          ],
        ),
      ),
    );
  }
}