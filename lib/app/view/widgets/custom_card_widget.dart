import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  const CustomCardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(1),
        ),
      ),
      elevation: 10,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: child,
    );
  }
}
