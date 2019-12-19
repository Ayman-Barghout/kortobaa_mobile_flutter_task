import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key key, this.onPressed, this.iconData})
      : super(key: key);

  final Function onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: new Icon(
        iconData,
        color: Colors.white,
        size: 35.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(15.0),
    );
  }
}
