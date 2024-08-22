import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  const textField({
    super.key,
    required this.textFieldText,
  });

  final String textFieldText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.all(8),
        hintText: textFieldText,
        hintMaxLines: 1,
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
