import 'package:fit_track/bottom_button.dart';
import 'package:fit_track/bottom_nav_bar.dart';
import 'package:fit_track/bottombutton1.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class DietPlan extends StatefulWidget {
  const DietPlan({Key? key, required this.interpretation}) : super(key: key);
  final String interpretation;

  @override
  _DietPlanState createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
  late List<Widget> chosenList;

  List<Widget> underweight = const [
    Text(
      'Underweight!',
      style: TextStyle(
        fontSize: 40.0,
        color: kBottomContainerColour,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 25.0,
    ),
    Text(
      'DO\'s',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),
    ),
    Text(
      '• Eat more often',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Drink Milk',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Try Weight gainer shakes',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Use Bigger Plates',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Add cream to your coffee',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Take Creatine',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Get Quality Sleep',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Eat your protein first and vegetables last',
      style: TextStyle(fontSize: 20.0),
    ),
    SizedBox(
      height: 25.0,
    ),
    Text(
      'DONT\'s',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),
    ),
    Text(
      '• Drink water before meals',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Smoke',
      style: TextStyle(fontSize: 20.0),
    ),
    SizedBox(
      height: 25.0,
    ),
    Text(
      'FOOD ITEMS TO LIMIT',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),
    ),
    Text(
      '• Whole Eggs',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Leafy Greens.',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Salmon.',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Cruciferous Vegetables.',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Lean Beef and Chicken Breast',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Boiled Potatoes.',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Tuna.',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Beans and Legumes.',
      style: TextStyle(fontSize: 20.0),
    ),
  ];

  List<Widget> overweight = const [
    Text(
      'Overweight!',
      style: TextStyle(
        fontSize: 40.0,
        color: kBottomContainerColour,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 25.0,
    ),
    Text(
      'DO\'s',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),
    ),
    Text(
      '• Eat more vegetables - add them at every meal.',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Drink plenty of water - you can become hungry when thirsty.',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Try eating off smaller plates so as to eat smaller portions',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Exercise between 30 minutes to one hour each day with moderate exercise - brisk walking, team sport, cycling or swimming.',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Be mindful of what you put in your mouth and your shopping trolley.',
      style: TextStyle(fontSize: 20.0),
    ),
    SizedBox(
      height: 25.0,
    ),
    Text(
      'DONT\'s',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),
    ),
    Text(
      '• Rely on soft drinks, sweetened cereals, cookies and cakes, donuts and pastries, chips, and confectionery to get you through the day.',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Don\'t skip meals. This will tempt you to snack and DO NOT snack between meals',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Avoid eating quickly. Sit and chew each bite. Try using chopsticks!',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Don\'t food shop when you\'re hungry.',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Don\'t eat more than two or three pieces of fruit per day',
      style: TextStyle(fontSize: 20.0),
    ),
    SizedBox(
      height: 25.0,
    ),
    Text(
      'FOOD ITEMS TO CONSUME',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),
    ),
    Text(
      '• Choose minimally processed, whole foods',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Whole grains (whole wheat, steel cut oats, brown rice, quinoa)',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Vegetables (a colorful variety-not potatoes)',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Whole fruits (not fruit juices)',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Nuts, seeds, beans, and other healthful sources of protein (fish and poultry)',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Plant oils (olive and other vegetable oils).',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Drink water or other beverages that are naturally calorie-free',
      style: TextStyle(fontSize: 20.0),
    ),
  ];

  List<Widget> normal = const [
    Text(
      'Normal!',
      style: TextStyle(
        fontSize: 40.0,
        color: kBottomContainerColour,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 25.0,
    ),
    Text(
      'Creating and maintaining healthy eating habits doesn’t have to be hard. If you start by incorporating small changes into your daily habits, you can make a big impact on your eating pattern and create lasting, healthy eating habits. Try including at least six of the following eight goals into your diet by adding one new goal each week.',
      style: TextStyle(fontSize: 20.0),
    ),
    SizedBox(
      height: 25.0,
    ),
    Text(
      '• Make half your plate fruits and vegetables',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Make half the grains you eat whole grains',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Switch to fat-free or low-fat (1%) milk',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Choose a variety of lean protein foods',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Compare sodium in foods',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Drink water instead of sugary drinks',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Eat some seafood',
      style: TextStyle(fontSize: 20.0),
    ),
    Text(
      '• Cut back on solid fats',
      style: TextStyle(fontSize: 20.0),
    ),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.interpretation == 'Underweight') {
      setState(() {
        chosenList = underweight;
      });
    } else if (widget.interpretation == 'Overweight') {
      setState(() {
        chosenList = overweight;
      });
    } else {
      setState(() {
        chosenList = normal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF5DB),
      appBar: AppBar(
        title: const Text(
          'Diet-Plan',
        ),
        backgroundColor: kActiveCardColour,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: chosenList,
              ),
            ),
            BottomButton1(
              buttonTitle: 'Go to Calorie Tracker',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BNavBar(selectedPage: 1),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
