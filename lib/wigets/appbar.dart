import 'package:flutter/material.dart';

import '../constrants/colors.dart';

AppBar customAppBar() {
  return AppBar(
    backgroundColor: tdBGColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
        ),
        const Text(
          'C a r  W a l y',
          style: TextStyle(
              color: tdBlack, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        Container(
          height: 40,
          width: 40,
          child: const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/ahmed.jpg'),
          ),
        )
      ],
    ),
    elevation: 0,
  );
}
