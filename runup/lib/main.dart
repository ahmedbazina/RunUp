import 'package:flutter/material.dart';
import 'package:runup/screens/Onboarding.dart';

void main() => runApp(Runup());

class Runup extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
    );
  }
}
