import 'package:flutter/material.dart';
import 'package:wttco/core/resources/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.text,required this.onPressed}) : super(key: key);
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      child:  Text(text),
    );
  }
}
