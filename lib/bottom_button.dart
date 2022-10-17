import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({required this.buttonTitle, required this.onTap, Key? key})
      : super(key: key);
  final void Function()? onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      width:  MediaQuery.of(context).size.width*.5,
      height: 60,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width:  MediaQuery.of(context).size.width*.5,
          height: 60.0,
          decoration: BoxDecoration(
            color: kBottomContainerColour,

            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              buttonTitle,
              style: kLargeButtonTextStyle,
            ),
          ),
          margin: const EdgeInsets.only(top: 10.0),
        ),
      ),
    );
  }
}
