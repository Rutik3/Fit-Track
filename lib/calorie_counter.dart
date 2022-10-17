import 'package:fit_track/bottom_button.dart';
import 'package:fit_track/calorie_brain.dart';
import 'package:fit_track/calorie_results.dart';
import 'package:fit_track/constants.dart';
import 'package:flutter/material.dart';

class Calorie extends StatefulWidget {
  const Calorie({Key? key}) : super(key: key);

  @override
  _CalorieState createState() => _CalorieState();
}

class _CalorieState extends State<Calorie> {
  TextEditingController myController = TextEditingController();
  FixedExtentScrollController scrollController = FixedExtentScrollController();
  List<Widget> displayList = [];
  bool visibility = false;

  Future<void> _showMyDialog(
      {required String title, required String description}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    setState(() {
      for (var i in sortedKeys) {
        displayList.add(
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            child: Text(
              i,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            color: Colors.cyan,
          ),
        );
      }
    });
    super.initState();
  }

  bool isDouble(String s) {
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Scroll and select the food item',
            style: kResultTextStyle,
          ),
          const SizedBox(
            height: 40.0,
          ),
          Expanded(
            child: ListWheelScrollView(
              children: displayList,
              diameterRatio: 2,
              itemExtent: 50,
              useMagnifier: true,
              magnification: 1.5,
              controller: scrollController,
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          TextField(
            controller: myController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 30.0,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF24D876),
                  width: 2.5,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF24D876),
                  width: 2.5,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
              hintText: 'Enter amount(in gms) of the item eaten',
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Visibility(
            visible: visibility,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 30.0,
                ),
                child: Text(
                  'Please enter a proper decimal number',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BottomButton(
              buttonTitle: 'Add Item',
              onTap: () {
                if (myController.text.isEmpty) {
                  setState(() {
                    visibility = true;
                  });
                } else if (!isDouble(myController.text)) {
                  setState(() {
                    visibility = true;
                  });
                } else {
                  Item item = Item(
                    itemName: sortedKeys[scrollController.selectedItem],
                    calorie: double.parse(myController.text),
                  );
                  if (selectedItems.contains(item)) {
                    setState(() {
                      visibility = true;
                      _showMyDialog(
                        title: 'Duplicate entry',
                        description:
                            'You have entered the same item with the same quantity again.Please change atleast one field!',
                      );
                    });
                  } else {
                    setState(() {
                      visibility = false;
                    });
                    selectedItems.add(item);
                    _showMyDialog(
                      title: 'Success',
                      description: 'Item was added successfully!',
                    );
                    myController.clear();
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BottomButton(
              buttonTitle: 'Check Results',
              onTap: () {
                if (selectedItems.isEmpty) {
                  _showMyDialog(
                    title: 'Item Required',
                    description: 'Please add some items first to proceed!',
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CalorieResult(),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
