import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/iconContent.dart';
import 'package:bmi_calculator/resuableCard.dart';
import 'resultScreen.dart';
import 'bottomButton.Dart';
import 'calculator.Dart';

int height = 140;
int age = 20;
int weight = 65;

 //For Material Theme
const primaryColor = Color(0xFF0A0E21);
const scaffoldBackgroundColor = Color(0xFF0A0E21);

// For Bottom Container
const bottomContainerColor = Color(0xFFEB1555);

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}
class _InputScreenState extends State<InputScreen> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

// 1 for male, 2 for female
  void changeColor(int gender)
  {
    if(gender == 1)
    {
      if(maleCardColor == inactiveCardColor)
      {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      }
      else{
        maleCardColor = inactiveCardColor;
      }
    }
    if(gender == 2)
    {
      if(femaleCardColor == inactiveCardColor)
      {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      }
      else{
        femaleCardColor = inactiveCardColor;
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      
      body: Column(
        children: [
          Expanded(
            // Male column
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        changeColor(1);
                      });
                    },
                      child: ResuableCard(
                      colour: maleCardColor,
                      cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                    ),
                  )

          ),
          Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        changeColor(2);
                      });
                    },
                      child: ResuableCard(
                      colour: femaleCardColor,
                      cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      ),
                  )
          )
        ]
      ), 
    ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: inactiveCardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  height.toString() + 'cm',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Slider(
                  value: height.toDouble(), 
                  min: 120,
                  max: 220,
                  activeColor: bottomContainerColor,
                  //inactiveColor: inactiveCardColor,
                  onChanged: (newValue){
                    setState(() {
                      height = newValue.round();
                      }
                    );
                  }
                )

                ],
              ),
            ) 
          ),
          
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(colour: inactiveCardColor,
                  cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                          Text(
                            '$weight',
                            style: TextStyle(
                              fontSize: 40,
                            )
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight = weight - 1;
                                  }
                                  );
                                },
                                heroTag: null,
                                child: Icon(FontAwesomeIcons.minus, color: Colors.white),
                                backgroundColor: Color(0xFF4C4F5E),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                heroTag: null,
                                child: Icon(FontAwesomeIcons.plus, color: Colors.white),
                                backgroundColor: Color(0xFF4C4F5E),
                                )
                          ],
                        )
                      ],
                      ),
                      )
                  

                  
          ),
          Expanded(
                  child: ResuableCard(colour: inactiveCardColor,
                  cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                              fontSize: 40,
                            )
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age = age  -1;
                                  });
                                },
                                heroTag: null,
                                child: Icon(FontAwesomeIcons.minus, color: Colors.white),
                                backgroundColor: Color(0xFF4C4F5E),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                heroTag: null,
                                child: Icon(FontAwesomeIcons.plus, color: Colors.white),
                                backgroundColor: Color(0xFF4C4F5E),
                                )
                          ],
                        )
                      ],
                      ),
                      )
          ),
        ],
      ),
    ),
    BottomButton(
      buttonTitle: 'CALCULATE',
      onTap: (){
        Calculator cal = Calculator(height: height, weight: weight); 
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => ResultScreen(
                  bmiResult: cal.calculateBMI(),
                  text: cal.getResult(),
                  message: cal.message(),
                )
                )
              );
            },
            )
  ]
      )
    );
  }
}



