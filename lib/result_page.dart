import 'package:bmi/constant.dart';
import 'package:flutter/material.dart';
import 'package:bmi/reusable_card.dart';
import 'constant.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.BMI, required this.interpretation, required this.result});

  final String BMI;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                child: Text(
                  "Your Result",
                  style: kYourResultStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                rang: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text(
                        result,
                        style: kWeightStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        BMI,
                        style: kBMIStyle,
                      ),
                    ),
                    Text(
                      interpretation,
                      style: kHealthTipStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: "RE-CALCULATE",
            ),
          ],
        ),
      ),
    );
  }
}
