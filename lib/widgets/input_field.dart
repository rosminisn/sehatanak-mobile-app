import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final Function(String) onChanged;

  const InputField({super.key, required this.label, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF1E293B))),
          const SizedBox(height: 8),
          TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(14),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
