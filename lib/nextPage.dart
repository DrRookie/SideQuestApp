import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_angelhack_new/QuestionsPage.dart';




class QuestionsPage extends StatefulWidget {
  static String routeName = '/questionsPage';

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5b8bdf),

      body: Padding(
        padding: const EdgeInsets.only(left: 0.0, top: 350.0),
        child: Column(

          children: [
            Center(child: Transform.translate(offset: Offset(0,-120)
              ,child: Text('Hold your',style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white),)))
            ,Align(
              alignment: Alignment.topLeft,
                child: Transform.translate(offset: Offset(120,-110),
                child: Text('Horses',style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white),)))
            ,Center(child: Transform.translate(offset: Offset(0,-100)
                ,child: const Text('We need some information to measure your financial health',textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: Colors.white,))))
            ,Transform.translate(offset: Offset(0,-60),child:ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {Navigator.of(context).pushNamed(Question1Page.routeName); } , child: Text("Take Survey")
               )
            )],

        ),
      ), );
  }

  }
