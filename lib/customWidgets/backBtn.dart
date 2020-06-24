import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        onPressed: () => Navigator.pop(context),
        splashColor: Color(0xff04364f),
        iconSize: MediaQuery.of(context).size.height * 0.04,
        tooltip: 'Back Button',
      ),
    );
  }
}
