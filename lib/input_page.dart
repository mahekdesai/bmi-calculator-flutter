import 'package:bmi/result_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi/reusable_card.dart';
import 'package:bmi/gender_widget.dart';
import 'constant.dart';
import 'package:bmi/round_icon_button.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum genderType {
  male,
  female
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  genderType ? gender;
  int height = 182;
  int weight = 62;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    onPress: () {
                      setState((){
                        gender = genderType.male;
                      });
                    },
                    rang: gender == genderType.male ? kActiveCardColor : kInactiveCardColor,
                    cardChild: genderWidget(
                      iconName: Icons.male,
                      genderName: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    onPress: () {
                      setState((){
                        gender = genderType.female;
                      });
                    },
                    rang: gender == genderType.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: genderWidget(
                      iconName: Icons.female,
                      genderName: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              rang: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                          height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                          "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: kBottomContainerColor,
                      overlayColor: Color(0x1fEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newHeight) {
                          setState((){
                            height = newHeight.round();
                          });
                        }
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    rang: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT (in KGs)",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: Text(
                                  "-",
                                  style: kMinusStyle,
                                ),
                                onTap: (){
                                  setState((){
                                    weight--;
                                  });
                                },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                                icon: Text(
                                  "+",
                                  style: kPlusStyle,
                                ),
                              onTap: (){
                                  setState((){
                                    weight++;
                                  });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    rang: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Text(
                                "-",
                                style: kMinusStyle,
                              ),
                              onTap: (){
                                setState((){
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                                icon: Text(
                                  "+",
                                  style: kPlusStyle,
                                ),
                                onTap: () {
                                  setState((){
                                    age++;
                                  });
                                }
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                    BMI: calc.calculateBMI().toStringAsFixed(1),
                    interpretation: calc.getInterpretation(),
                    result: calc.getResult()
                ),
              ),
              );
            },
            text: "CALCULATE",
          ),
        ],
      ),
    );
  }
}

