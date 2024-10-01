import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String hint;
  final double width;
  final void Function(String) onChanged;

  const CustomTextFieldWidget({
    super.key,
    required this.hint,
    required this.width,
    required this.onChanged,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 40,
      child: TextFormField(
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: const TextStyle(fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(color: Color.fromARGB(55, 0, 0, 0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(color: Color.fromARGB(55, 0, 0, 0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(55, 0, 0, 0)),
          ),
        ),
      ),
    );
  }
}
