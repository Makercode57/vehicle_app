import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vehicle_app/screens/login_screen.dart'; 
import 'dart:async';

void main() {
  runApp(VehicleApp());
}

class VehicleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vehicle App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue),
          elevation: 0,
        ),
      ),
      home: SplashScreen(), 
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isTextVisible = false; 

  @override
  void initState() {
    super.initState();

    // Show text after 1 second
    Timer(Duration(seconds: 1), () {
      setState(() {
        _isTextVisible = true;
      });
    });
    Timer(Duration(seconds: 4), () {
      setState(() => _isTextVisible = false);
    });
    _navigateToLoginScreen();
  }

  _navigateToLoginScreen() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/Animation.json'),
            AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: _isTextVisible ? 1.0 : 0.0,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Welcome to Vehicle App",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
