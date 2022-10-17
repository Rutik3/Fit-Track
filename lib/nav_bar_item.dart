import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    Key? key,
    required this.bgcolour,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.colour,
  }) : super(key: key);
  final Color bgcolour;
  final Color colour;
  final Icon icon;
  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Ink(
            padding: const EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 2,
            ),
            decoration: ShapeDecoration(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(20),
                  left: Radius.circular(20),
                ),
              ),
              color: bgcolour,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: onPressed,
              icon: icon,
              iconSize: 30,
              color: colour,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: colour,
            ),
          ),
        ],
      ),
    );
  }
}
