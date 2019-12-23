import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart'
    as textStyles;

class RoundIconButtonWithLabel extends StatelessWidget {
  const RoundIconButtonWithLabel({
    Key key,
    @required this.onPressed,
    @required this.iconData,
    @required this.label,
  }) : super(key: key);

  final Function onPressed;
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RawMaterialButton(
          onPressed: onPressed,
          child: new Icon(
            iconData,
            color: Colors.white,
          ),
          shape: new CircleBorder(),
          elevation: 2.0,
          fillColor: Theme.of(context).primaryColor,
          padding: EdgeInsets.all(15.0),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: textStyles.roundIconButtonsTextStyle,
        ),
      ],
    );
  }
}
