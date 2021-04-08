import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {

  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {

  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.yellow,
      child: Center(child:
          Slider(
            value: rating,
            onChanged: (newRating) {
              print(newRating);
              setState(() => rating = newRating);
            },
            divisions: 24,
            min: 0.0,
            max: 12.0,
            label: "$rating",
          ),
      )
    );
  }
}
