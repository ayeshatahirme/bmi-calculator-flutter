import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
              ),            
              child: Expanded(
                  child: Row(
                    children: [
                      Container(
                        child: Expanded(
                            child: Column(
                              children: [Icon(FontAwesomeIcons.mars,
                              size: 80,),
                              SizedBox(
                                height: 15,
                                ),
                              Text(
                                "MALE",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                            
                            ),
                        )
                      ),
                      Expanded(
                          child: Container(
                          child: Column(
                            children: [
                              Icon(FontAwesomeIcons.venus,
                              size: 80,),
                              SizedBox(
                                height: 15,
                                ),
                              Text(
                                "FEMALE",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                            
                            )
                        ),
                      )
                                          
                    ],
                  ),
              ),
            ) 
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
              ),            
            ) 
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
              ),            
            ) 
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
              ),            
            ) 
          )
        ],
      ),
    );
  }
}