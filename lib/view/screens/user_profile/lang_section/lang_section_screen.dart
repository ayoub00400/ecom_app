import 'package:flutter/material.dart';

class LangSectionScreen extends StatelessWidget {
  const LangSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: const Center(child: Text('Lang section')),
      ),
    );
  }
}
