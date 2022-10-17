import 'package:fit_track/bmi_bmr.dart';
import 'package:fit_track/calorie_counter.dart';
import 'package:fit_track/constants.dart';
import 'package:flutter/material.dart';
import 'nav_bar_item.dart';

class BNavBar extends StatefulWidget {
  BNavBar({Key? key, required this.selectedPage}) : super(key: key);
  int selectedPage;

  @override
  _BNavBarState createState() => _BNavBarState();
}

class _BNavBarState extends State<BNavBar> {
  final pages = [
    const InputPage(),
    const Calorie(),
  ];
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
      body: pages[widget.selectedPage],
      bottomNavigationBar: BottomAppBar(
        color: kActiveCardColour,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: NavBarItem(
                  colour: widget.selectedPage == 0
                      ? kBottomContainerColour
                      : kBottomContainerColour.withOpacity(0.6),
                  bgcolour: widget.selectedPage == 0
                      ? const Color(0xFFE8DEF8)
                      : Colors.transparent,
                  label: 'BMI & BMR',
                  icon: const Icon(Icons.scale),
                  onPressed: () {
                    setState(() {
                      widget.selectedPage = 0;
                    });
                  },
                ),
              ),
              Expanded(
                child: NavBarItem(
                  colour: widget.selectedPage == 1
                      ? kBottomContainerColour
                      : kBottomContainerColour.withOpacity(0.6),
                  bgcolour: widget.selectedPage == 1
                      ? const Color(0xFFE8DEF8)
                      : Colors.transparent,
                  label: 'Cal-track',
                  icon: const Icon(Icons.fastfood),
                  onPressed: () {
                    setState(() {
                      widget.selectedPage = 1;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
