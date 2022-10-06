import 'package:flutter/material.dart';

class DummyScreen1 extends StatelessWidget {
  const DummyScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dummy screen 1"),
      ),
      body: const Center(child: Text("Dummy 1")),
    );
  }
}
