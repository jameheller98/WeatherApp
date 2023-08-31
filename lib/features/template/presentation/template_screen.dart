import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  const Template({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template'),
      ),
      body: const SizedBox.shrink(),
    );
  }
}
