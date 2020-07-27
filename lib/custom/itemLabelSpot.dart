import 'package:flutter/material.dart';
import 'package:spotegal/models/model_spot.dart';

class LabelItemSpot extends StatelessWidget {
  final ModelSpot model;
  final VoidCallback onPress;
  final int index;

  const LabelItemSpot({Key key, this.model, this.onPress, this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(right: 4, left: 4),
        decoration: BoxDecoration(
            color:
                index == int.parse(model.idSpot) ? Colors.white : Colors.blue,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Text("${model.nmSpot}"),
      ),
    );
  }
}
