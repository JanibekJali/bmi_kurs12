import 'dart:developer';

import 'package:bmi_kurs12/constants/colors/app_colors.dart';
import 'package:bmi_kurs12/pages/result_page.dart';
import 'package:bmi_kurs12/widgets/calculate_widget.dart';
import 'package:bmi_kurs12/widgets/custom_container_widget.dart';
import 'package:bmi_kurs12/widgets/weightAge_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color maleColor = AppColors.inactiveColor;
  Color femaleColor = AppColors.inactiveColor;
  double heightValue = 70;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Bmi Calculator',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomContainer(
                  icon: Icons.male,
                  text: 'Male',
                  tus: maleColor,
                  onTap: () {
                    setState(() {
                      maleColor = AppColors.activeColor;
                      femaleColor = AppColors.inactiveColor;
                    });
                  },
                ),
                CustomContainer(
                  onTap: () {
                    setState(() {
                      femaleColor = AppColors.activeColor;
                      maleColor = AppColors.inactiveColor;
                    });
                  },
                  icon: Icons.female,
                  text: 'FEMale',
                  tus: femaleColor,
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Height'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        heightValue.toStringAsFixed(0),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                      activeColor: Colors.red,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.blue,
                      max: 220,
                      min: 50,
                      value: heightValue,
                      onChanged: (adamdinBasuusu) {
                        heightValue = adamdinBasuusu;
                        setState(() {});
                      })
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeightAge(
                    tag1: '3',
                    tag2: '4',
                    title: 'Weight',
                    number: weight.toString(),
                    onPressedMines: () {
                      setState(() {
                        setState(() {
                          weight--;
                        });
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        weight++;
                      });
                    }),
                WeightAge(
                    tag1: '1',
                    tag2: '2',
                    title: 'Age',
                    number: age.toString(),
                    onPressedMines: () {
                      setState(() {
                        setState(() {
                          age--;
                        });
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        age++;
                      });
                    }),
              ],
            ),
          ],
        ),
        bottomNavigationBar: CalculateWidget(
          text: 'Calculate',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  height: heightValue,
                  kg: weight,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
