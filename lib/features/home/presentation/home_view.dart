import 'package:flutter/material.dart';
import 'package:ososs_flutter_task/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const HomeViewBody(),
    );
  }
}
