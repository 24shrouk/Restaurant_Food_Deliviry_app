import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';

class CustomTextFormFiled extends StatefulWidget {
  CustomTextFormFiled(
      {super.key,
      this.hint,
      this.onChange,
      this.obscurText = false,
      this.icon,
      this.prefIcon,
      this.maxLines = 1});

  final String? hint;
  bool obscurText;
  Function(String)? onChange;
  IconButton? icon;
  Icon? prefIcon;

  final int maxLines;

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: widget.maxLines,
        obscureText: widget.obscurText,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Field is required';
          }
        },
        onChanged: widget.onChange,
        decoration: InputDecoration(
            suffixIcon: widget.icon,
            prefixIcon: widget.prefIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: kPrimaryColor,
              ),
            ),
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: kPrimaryColor,
              ),
            )),
      ),
    );
  }
}
