import 'package:fit_track/bottom_button.dart';
import 'package:fit_track/calcuator_brain.dart';
import 'package:fit_track/calorie_brain.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CalorieResult extends StatefulWidget {
  const CalorieResult({Key? key}) : super(key: key);

  @override
  _CalorieResultState createState() => _CalorieResultState();
}

class _CalorieResultState extends State<CalorieResult> {
  List<Widget> displayWidgets = [
    const Text(
      'Results',
      style: TextStyle(
        fontSize: 40.0,
        color: kBottomContainerColour,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
    ),
    const Text(
      'Your selected items:',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.cyan,
      ),
    ),
    Text(
      'Your total calories: ${getTotalCalories()}',
      style: const TextStyle(
        fontSize: 25.0,
        color: Colors.cyan,
      ),
    ),
    const Divider(
      thickness: 3.0,
    ),
    const SizedBox(
      height: 10.0,
    ),
    Text(
      bMR == 0
          ? 'Calculate your BMR to get more detailed result!'
          : 'Required Calories: $bMR',
      style: const TextStyle(
        fontSize: 25.0,
        color: Colors.cyan,
      ),
      textAlign: TextAlign.center,
    ),
    const SizedBox(
      height: 15.0,
    ),
  ];

  @override
  void initState() {
    for (Item i in selectedItems) {
      setState(
        () {
          displayWidgets.insert(
            2,
            Text(
              '• ${i.itemName} -> ${i.calorie}gm',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          );
        },
      );
    }
    if (bMR != 0) {
      double difference = bMR - calorieTotal;
      displayWidgets.add(
        Text(
          'Difference: $difference',
          style: const TextStyle(
            fontSize: 25.0,
            color: Colors.cyan,
          ),
        ),
      );
      displayWidgets.add(
        const SizedBox(
          height: 15.0,
        ),
      );
      if (difference < -20) {
        displayWidgets.add(
          const Text(
            'You should reduce your calorie intake!!',
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        );
      } else if (difference > 20) {
        displayWidgets.add(
          const Text(
            'You should increase your calorie intake!!',
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        );
      } else {
        displayWidgets.add(
          const Text(
            'You should maintain your calorie intake!!',
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        );
      }
    }
    displayWidgets.add(
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 60,
        ),
        child: BottomButton(buttonTitle: 'Reset', onTap: (){
          selectedItems.clear();
          Navigator.pop(context);
        }),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF5DB),
      appBar: AppBar(
        title: const Text(
          'Fit-Track',
        ),
        backgroundColor: kActiveCardColour,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: displayWidgets,
        ),
      ),
    );
  }
}
