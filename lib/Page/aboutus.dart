// aboutus.dart
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to Fitness Club",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Your comprehensive platform for achieving health and wellness goals. "
                  "We are dedicated to empowering individuals with the tools, guidance, and "
                  "community support needed to lead a healthier, more active lifestyle.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              "Our Story",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Fitness Club was born out of a passion for fitness and a commitment to making "
                  "healthy living accessible to everyone. Our application combines personalized "
                  "workout plans, nutritional advice, and progress tracking features to help you "
                  "stay motivated on your fitness journey. Whether you're just starting out or are a "
                  "seasoned athlete, our goal is to provide you with the best digital experience for "
                  "achieving your health objectives.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              "Our Mission",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "• Empowerment: To empower users with personalized fitness programs tailored to their unique goals.\n\n"
                  "• Accessibility: To make fitness resources accessible anytime, anywhere.\n\n"
                  "• Community: To create a supportive community where members inspire and motivate each other.\n\n"
                  "• Innovation: To continuously enhance our app with cutting-edge features that make fitness engaging and fun.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              "Meet the Team",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Milan Goswami – Lead Developer\n"
                  "Vaibhav Beladiya – Mobile Application Specialist\n"
                  "Krish Maisuriya – Backend Engineer\n"
                  "Divyesh Chavda – UX/UI Designer",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              "Our Vision for the Future",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "We are continuously evolving to meet the needs of our community. In the near future, expect features like:\n"
                  "- Enhanced Personalization: More detailed analytics and custom workout recommendations.\n"
                  "- Interactive Challenges: Community-driven challenges and rewards to keep your fitness journey exciting.\n"
                  "- Integrated Wellness: A holistic approach that includes mental well-being and nutrition guidance.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              "Thank you for being a part of the Fitness Club community. We believe that with the right tools and a supportive network, everyone can achieve their fitness dreams. Together, let's build a healthier, happier future!",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
