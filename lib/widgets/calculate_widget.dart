import 'package:flutter/material.dart';

class CalculateWidget extends StatelessWidget {
  const CalculateWidget({
    required this.text,
    required this.onTap,
  });
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        height: MediaQuery.of(context).size.height * 0.09,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
