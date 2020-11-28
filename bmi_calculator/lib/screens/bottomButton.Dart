import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  
  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: onTap,
              child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFFEB1555),
              ),
              child: Center(
                  child: Text(
                    buttonTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                )
            ),
          );
  }
}