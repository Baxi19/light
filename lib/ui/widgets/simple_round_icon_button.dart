import 'package:flutter/material.dart';

class SimpleRoundIconButton extends StatelessWidget {

  final Color backgroundColor;
  final Text buttonText;
  final Icon icon;
  final Color iconColor;
  final Alignment iconAlignment;
  final VoidCallback onPressed;

  SimpleRoundIconButton({
    required this.iconColor,
    required this.onPressed,
    required this.buttonText,
    required this.icon,
    this.backgroundColor = Colors.deepPurple,
    this.iconAlignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child:  Row(
        children: <Widget>[
         Expanded(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              splashColor: this.backgroundColor,
              color: this.backgroundColor,
              child: Row(
                children: <Widget>[

                  iconAlignment == Alignment.centerLeft ? new Transform.translate(
                    offset: Offset(-10.0, 0.0),
                    child: new Container(
                      padding: const EdgeInsets.all(5.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                             BorderRadius.circular(28.0)),
                        splashColor: Colors.white,
                        color: Colors.white,
                        child: Icon(
                          icon.icon,
                          color: iconColor == null ? backgroundColor : iconColor,
                        ),
                        onPressed: () => {},
                      ),
                    ),
                  ) : Container(),

                  iconAlignment == Alignment.centerLeft ? Expanded(
                    child: Container(),
                  ): Container(),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                    child: buttonText,
                  ),

                  iconAlignment == Alignment.centerRight ?  Expanded(
                    child: Container(),
                  ): Container(),

                  iconAlignment == Alignment.centerRight ?  Transform.translate(
                    offset: Offset(10.0, 0.0),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(28.0)),
                        splashColor: Colors.white,
                        color: Colors.white,
                        child: Icon(
                          icon.icon,
                          color: iconColor == null ? backgroundColor : iconColor,
                        ),
                        onPressed: () => {},
                      ),
                    ),
                  ) : Container()

                ],
              ),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}