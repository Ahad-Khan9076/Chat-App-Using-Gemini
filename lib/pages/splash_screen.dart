import 'package:chat_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // Navigate to the home screen after a delay
  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3)); // 3 seconds delay
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const HomePage(), // Replace with your home screen widget
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogo(), // Logo in a container
            const SizedBox(height: 20),
            _buildLoadingIndicator(), // Custom loading indicator
          ],
        ),
      ),
    );
  }

  // Logo in a styled container
  Widget _buildLogo() {
    return Container(
      padding: const EdgeInsets.all(20), // Add padding around the logo
      decoration: BoxDecoration(
        color: Colors.teal[50], // Light background color for the logo container
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Shadow color
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Image.asset(
        'assets/logo.png', // Ensure this path is correct
        height: 150, // Adjust the height as necessary
      ),
    );
  }

  // Custom loading indicator with star icon
  Widget _buildLoadingIndicator() {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(
          width: 50, // Set width for the loading indicator
          height: 50, // Set height for the loading indicator
        ),
        const CircularProgressIndicator(
          strokeWidth: 5, // Adjust stroke width
          valueColor: AlwaysStoppedAnimation<Color>(Colors.teal), // Customize color
        ),
        // Star icon on top of the loading indicator
        Positioned(
          child: Icon(
            Icons.star,
            color: Colors.teal, // Color of the star icon
            size: 30, // Size of the star icon
          ),
        ),
      ],
    );
  }
}
