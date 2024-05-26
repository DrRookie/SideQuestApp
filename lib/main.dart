import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hackathon_angelhack_new/QuestionsPage.dart';
import 'package:hackathon_angelhack_new/nextPage.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'SideQuest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),

      home: const MyHomePage(title: 'SideQuest'),
      routes: {
        QuestionsPage.routeName : (_) {
          return QuestionsPage(); },

        Question1Page.routeName : (_) {
          return Question1Page(); },



      },




    );
  }
}

class MyHomePage extends StatefulWidget {
  static String routeName = '/'; //
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xFF5b8bdf),
      body: Stack(



        children: [

          //Image.asset('assets/images/13.png'),
          Align(
            alignment: Alignment.topLeft
            ,child :Transform.translate(offset: Offset(-160,0),
          child:Image.asset("images/13.png", fit: BoxFit.cover, width: double.infinity, height: double.infinity,),

          ))
          ,Align(
              alignment: Alignment.topLeft
              ,child :Transform.translate(offset: Offset(-20,100),
            child:Image.asset("images/13.png", fit: BoxFit.cover, width: double.infinity, height: double.infinity,),

          ))
          ,Align(
              alignment: Alignment.topLeft
              ,child :Transform.translate(offset: Offset(110,-20),
            child:Image.asset("images/13.png", fit: BoxFit.cover, width: double.infinity, height: double.infinity,),

          ))
          ,Align(
              alignment: Alignment.topLeft
              ,child :Transform.translate(offset: Offset(220,110),
            child:Image.asset("images/13.png", fit: BoxFit.cover, width: double.infinity, height: double.infinity,),

          ))
          ,Align(
              alignment: Alignment.topLeft
              ,child :Transform.translate(offset: Offset(0,0),
            child:Image.asset("images/15.png", fit: BoxFit.cover, width: double.infinity, height: double.infinity,),

          ))
          ,Align(
              alignment: Alignment.topLeft
              ,child :Transform.translate(offset: Offset(0,0),
            child:Image.asset("images/14.jpg", fit: BoxFit.cover, width: double.infinity, height: double.infinity,),

          ))
          ,Align(
              alignment: Alignment.topLeft
              ,child :Transform.translate(offset: Offset(0,0),
            child:Image.asset("images/16.png", fit: BoxFit.cover, width: double.infinity, height: double.infinity,),

          ))
          //Image.asset("images/13.png", fit: BoxFit.cover, width: double.infinity, height: double.infinity,),
          ,SafeArea(
            //child: Padding(Image.asset("assets/images/kiyomizu-dera.jpg"),
            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "SideQuest",
                    style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white,fontSize: 45))



                  ,Spacer(),
                  InkWell(
                    onTap: () => Get.to(QuestionsPage()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(0.75), // 15
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {Navigator.of(context).pushNamed(QuestionsPage.routeName); },
                        child: Text('Ready to retire?'),
                      )
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
