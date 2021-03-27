import 'package:flutter/material.dart';
import 'package:tic_tac_toe/homepage.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.white),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Let's Play Tic-Tac-Toe",
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
