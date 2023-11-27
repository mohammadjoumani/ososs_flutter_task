import 'package:flutter/material.dart';

import 'widgets/animations_view_body.dart';

class AnimationsView extends StatelessWidget {
  const AnimationsView({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animations"),
      ),
      body: AnimationsViewBody(name: name),
    );
  }
}
