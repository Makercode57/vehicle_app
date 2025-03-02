import 'package:flutter/material.dart';
import 'vehicle_list_screen.dart'; // Import Home Screen
import 'logo_widget.dart'; // Import Logo Widget

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController otpController = TextEditingController();

  void verifyOTP() {
    // Simulate OTP verification (in a real app, verify the OTP with backend)
    if (otpController.text.length == 6) {
      // If OTP is valid, navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => VehicleListScreen()), // Navigate to Home Screen
      );
    } else {
      // Show an error if the OTP is invalid
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid OTP! Please try again."),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background logo with opacity
          LogoWidget(opacity: 0.1), // Add the LogoWidget behind everything
          // Main content of the screen
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset('assets/logo.png', height: 100),
                SizedBox(height: 20),
                Text("Enter the 6-digit OTP sent to your email or phone."),
                SizedBox(height: 20),
                TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    labelText: "Enter OTP",
                    prefixIcon: Icon(Icons.security),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: verifyOTP, // Call verifyOTP function when button is pressed
                  child: Text("Verify OTP"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

