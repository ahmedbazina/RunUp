import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:runup/utilities/styles.dart';
import '../root.dart';
import 'dart:async';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  //hides the top status bar and navigation controls so the app in using the
  //the full screen
  @override
  void initState(){
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();

    //TODO: relook at the timer again
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF707070),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFF3E67D6)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 550.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    //Onboarding content
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(30.0), //padding from top
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'Have a good health',
                              style: onboardingTitle,
                              textAlign: TextAlign.center,
                            ),
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/screens/onboarding/onboarding1.png',
                                ),
                                height: 281.0,
                                width: 281.0,
                              ),
                            ),
                            SizedBox(height: 100.0),
                            Text(
                              'Being healthy is all, no health is nothing. \nSo why do not we',
                              style: onboardingDesc,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30.0), //padding from top
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'Be stronger',
                              style: onboardingTitle,
                              textAlign: TextAlign.center,
                            ),
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/screens/onboarding/onboarding2.png',
                                ),
                                height: 281.0,
                                width: 281.0,
                              ),
                            ),
                            SizedBox(height: 100.0),
                            Text(
                              'Take 30 minutes of bodybuilding every day \nto get physically fit and healthy.',
                              style: onboardingDesc,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30.0), //padding from top
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'Have nice body ',
                              style: onboardingTitle,
                              textAlign: TextAlign.center,
                            ),
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/screens/onboarding/onboarding3.png',
                                ),
                                height: 281.0,
                                width: 281.0,
                              ),
                            ),
                            SizedBox(height: 100.0),
                            Text(
                              'Bad body shape, poor sleep, lack of strength,\nweight gain, weak bones, easily traumatized \nbody, depressed, stressed, poor metabolism, \npoor resistance',
                              style: onboardingDesc,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FlatButton(child: Text(
                      'Start',
                      style: startbtn,
                    ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.all(20),
                      color: Colors.white,
                      textColor: Color(0xFF3E67D6),

                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Root(); //TODO: change this to go to login
                        }));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
