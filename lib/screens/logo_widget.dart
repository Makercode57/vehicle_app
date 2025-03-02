import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double opacity; 

  LogoWidget({this.opacity = 0.1}); 

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Opacity(
        opacity: opacity,
        child: Image.asset(
          'assets/logo.png', 
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
