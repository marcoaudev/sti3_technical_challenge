import 'package:flutter/material.dart';
import 'package:sti3_app/app/view/widgets/custom_drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawerWidget(),
      appBar: AppBar(
        title: const Text("STI3"),
      ),
    );
  }
}
