import 'package:flutter/material.dart';
import 'package:runup/root.dart';

void main() => runApp(Runup());

class Runup extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Root(),
    );
  }
}
