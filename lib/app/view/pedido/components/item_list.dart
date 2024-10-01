import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final String item;
  final Color? color;
  const ItemList({
    super.key,
    required this.item,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Text(
        item,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 12, color: color),
      ),
    );
  }
}
