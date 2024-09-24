import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const PasswordField({required this.hintText, required this.controller, super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obsecureText,
      decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obsecureText = !_obsecureText;
                });
              },
              icon: Icon(
                  _obsecureText ? Icons.visibility_off : Icons.visibility))),
    );
  }
}
