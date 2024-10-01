import 'package:flutter/material.dart';

class CustomButtomWidget extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const CustomButtomWidget({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
