import 'dart:math';

import 'package:bmi_kurs12/constants/colors/app_colors.dart';
import 'package:bmi_kurs12/data/bmi_data.dart';
import 'package:bmi_kurs12/widgets/calculate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.height, required this.kg});
  final double height;
  final int kg;
  @override
  Widget build(BuildContext context) {
    final bmi = BmiData.bmiCalculate(height, kg);
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Жыйынтык',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    BmiData.bmiResult(bmi).toString(),
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greenColor.withOpacity(0.8),
                    ),
                  ),
                  Text(
                    BmiData.bmiCalculate(height, kg).toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 84,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Center(
                    child: Text(
                      BmiData.giveDescription(bmi).toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CalculateWidget(
          text: 'Re-Calculate',
          onTap: () {
            Navigator.pop(context);
          }),
    );
  }
}
