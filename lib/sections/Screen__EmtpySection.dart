import 'package:flutter/material.dart';

class EmptySections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[200],
      ),
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "This section is empty",
          style: TextStyle(
            color: Colors.grey[500],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
