import 'package:bmi_kurs12/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

class WeightAge extends StatelessWidget {
  const WeightAge({
    super.key,
    required this.onPressedMines,
    required this.onPressedPlus,
    this.title,
    this.number,
    required this.tag1,
    required this.tag2,
  });
  final void Function()? onPressedMines;
  final void Function()? onPressedPlus;
  final String? title;
  final String? number;
  final Object tag1;
  final Object tag2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(15)),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            title!.toUpperCase(),
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            '$number',
            style: TextStyle(
                color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: tag1,
                onPressed: onPressedMines,
                child: Icon(
                  Icons.remove,
                  size: 30,
                ),
              ),
              FloatingActionButton(
                heroTag: tag2,
                onPressed: onPressedPlus,
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
