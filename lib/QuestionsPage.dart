import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'globalstate.dart';
import 'dart:math';

int? liquidityRatio;
double? liquidAssets;
double? savings;
double? debtToAsset;
double? totalDebtServicing;
double? netInvested;
double? solvency;

int liquidity = 0;
int savingsCount = 0;
int debtCount = 0;
int investmentCount = 0;
int solvencyCount = 0;

//List<String> _answers = [];

//class Question1Page extends StatefulWidget {
//  static String routeName = '/question1page';

//  @override
//  State<Question1Page> createState() => _Question1PageState();
//}

class Question1Page extends StatefulWidget {
  static String routeName = '/question1page';

  @override
  State<Question1Page> createState() => _Question1PageState();
}

  class _Question1PageState extends State<Question1Page> {
  int _currentQuestionIndex = 0;
    List<String> _questions = [
      "What is your name?",
      "What is your age?",
      "Do you have any existing bank loan? (if yes, what is the remaining value",
      "Do you have overdue balance on your credit card? if yes, how much?",
      "What is your total assets worth? (e.g Houses, Jewellery, Car, etc)",
      "How much do you need to pay monthly on your debts?",
      "What is your monthly gross income?",
      "What is the total value of your invested assets?",
      "What are your current investments allocation? if any (e.g 50% stocks 50 % bonds)",
      "What is your risk appetite? (High risk , Medium risk , Low risk)",
      "How much is in your savings account?",
      "How much do you put into your savings account monthly?",
      "What is your monthly expenses?",
    ];
     List<String> _answers = [ "", "", "", "", "", "", "", "", "", "", "", "", ""];

    TextEditingController _textEditingController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      _textEditingController.dispose();
      super.dispose();
    }



    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        backgroundColor: Color(0xFF5b8bdf),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding (
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                _questions[_currentQuestionIndex],
                style: TextStyle(fontFamily:'Ubuntu',fontSize:  24.0 ,color: Colors.white),
                textAlign: TextAlign.center, // Center-align the text
              ),
      ),
              SizedBox(height: 20.0),
              Container(
                width: 250,
                child: TextField(

                  controller: _textEditingController,
                  onChanged: (value) {
                    _answers?.insert(_currentQuestionIndex, value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your answer',
                    filled: true, // Set to true to fill the TextField with fillColor
                    fillColor: Colors.white, // Set the fillColor to white
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
       // ElevatedButton(onPressed: () {Navigator.of(context).pushNamed(Question1Page.routeName); } , child: Text("Take Survey")
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {

                setState(() {
                    if (_currentQuestionIndex < _questions.length - 1) {
                      _currentQuestionIndex++;
                      _textEditingController.clear();
                    } else {
                      // Here, you can handle what to do when all questions are answered.
                      // For example, show a summary or perform any final action.
                      print("All questions answered!");
                      _showAnswers();
                      {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EvaluationPage())); }
                    }
                  });
                },
                child: Text(_currentQuestionIndex == _questions.length - 1
                    ? 'Finish'
                    : 'Next'),
              ),
            ],
          ),
        ),
      );




    }
    void _showAnswers() {
      // Show answers in console for demonstration

      //print("Answers:");
      //for (int i = 0; i < _questions.length; i++) {
        //print("${_questions[i]}: ${_answers[i]}");


      //}


      liquidityRatio = (double.parse(_answers.elementAt(10)??"") / double.parse(_answers.elementAt(12)??"")).round();
      //print(liquidityRatio);
      //print(double.parse(_answers?.elementAt(12)??""));


      if (liquidityRatio! > 3) {
        liquidity++;
      }


      liquidAssets = (double.parse(_answers.elementAt(10)) / double.parse(_answers.elementAt(4)) - double.parse(_answers.elementAt(2)));



       if (liquidAssets! > 0.15) {
         liquidity++;
       }

      print("Liquidity: $liquidity /2");



      savings = (double.parse(_answers.elementAt(11)??"") / double.parse(_answers.elementAt(6)));
      print(savings);



      if (savings! > 0.1) {
        savingsCount++;
      }

      print("savings: $savingsCount /1");

      debtToAsset = ((double.parse(_answers.elementAt(2)??"") + (double.parse(_answers.elementAt(3)))/ double.parse(_answers.elementAt(4))));
      print(debtToAsset);


      if (debtToAsset! > 0.5) {
        debtCount++;
      }

      print("debt: $debtCount /1");




      totalDebtServicing = (double.parse(_answers.elementAt(12)??"") / (double.parse(_answers.elementAt(6))/2));
      print(totalDebtServicing);

      if (totalDebtServicing! > 0.35) {
        debtCount++;
      }

      netInvested = ((double.parse(_answers.elementAt(7)??"") / double.parse(_answers.elementAt(4)) - double.parse(_answers.elementAt(2))));


      if (netInvested! > 0.5) {
        investmentCount++;
      }

      solvency = (double.parse(_answers.elementAt(4)??"") - double.parse(_answers.elementAt(2))) / double.parse(_answers.elementAt(4));


      if (solvency! > 0.5) {
        solvencyCount++;
      }

      print("Liquidity: $liquidity/2");
      print("Savings: $savingsCount/1");
      print("Debt: $debtCount/2");
      print("Investment: $investmentCount/1");
      print("Solvency: $solvencyCount/1");

    }

  }

class EvaluationPage extends StatefulWidget {
  static String routeName = '/evaluationPage';


  const EvaluationPage({super.key});

  @override
  State<EvaluationPage> createState() => _EvaluationPageState();
}
class _EvaluationPageState extends State<EvaluationPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5b8bdf),

      body: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 130.0),
        child: Column(


          children: [
            SizedBox(height: 80,),
            Text("EVALUATION", style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold) ),
            Text("Targets Met", style: TextStyle(fontSize: 17,color: Colors.white, decoration: TextDecoration.underline,decorationColor: Colors.white)),
            SizedBox(height: 65,),
            Text("Liquidity:       $liquidity/2" ,style: TextStyle(fontSize: 17, color: Colors.white)),
            SizedBox(height: 65,),
            Text("Savings:       $savingsCount/1",style: TextStyle(fontSize: 17, color: Colors.white)),
            SizedBox(height: 65,),
            Text("Debt:             $debtCount/2",style: TextStyle(fontSize: 17, color: Colors.white)),
            SizedBox(height: 65,),
            Text("Investment:  $investmentCount/1",style: TextStyle(fontSize: 17, color: Colors.white)),
            SizedBox(height: 65,),
            Text("Solvency:     $solvencyCount/1",style: TextStyle(fontSize: 17, color: Colors.white)),
          ],
        ),
      ),
    );
  }

}

