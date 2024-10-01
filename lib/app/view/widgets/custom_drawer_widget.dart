import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            ListTile(
              title: const Text(
                "PEDIDOS",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.of(context).pushNamed('/pedidos'),
            ),
            ListTile(
              title: const Text(
                "RELATÓRIOS",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.of(context).pushNamed('/relatorios'),
            ),
          ],
        ),
      ),
    );
  }
}
