import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          "images/home.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
