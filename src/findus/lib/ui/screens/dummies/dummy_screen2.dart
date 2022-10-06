import 'package:flutter/material.dart';

class DummyScreen2 extends StatelessWidget {
  const DummyScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dummy screen 2"),
      ),
      body: const Center(child: Text("Dummy 2")),
    );
  }
}
