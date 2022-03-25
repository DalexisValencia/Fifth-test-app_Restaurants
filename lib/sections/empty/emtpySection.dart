import 'package:flutter/material.dart';

class EmptySections extends StatelessWidget {
  final String? label;
  EmptySections({
    Key? key,
    this.label = "This section is empty",
  }) : super(key: key);
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
          label!,
          style: TextStyle(
            color: Colors.grey[500],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
