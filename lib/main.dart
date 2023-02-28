import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart' as animator;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
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
  bool isOpened = false;
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
      backgroundColor: Color(0xff101828),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: isOpened
            ?Container(
          padding: EdgeInsets.only(left: 4,right: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.4),
                ],
              ),
            ),
              child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
              animator.LightSpeedIn(
                child: FloatingActionButton(
                  onPressed: () {},
                  heroTag: "btn2",
                  child: const Icon(Icons.add,color: Colors.white,size: 20),
                ),
              ),
              SizedBox(width: 10),
              animator.LightSpeedIn(
                child: FloatingActionButton(
                  onPressed: () {},
                  heroTag: "btn3",
                  child: const Icon(Icons.add,color: Colors.white,size: 20),
                ),
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    isOpened = false;
                  });
                },
                heroTag: "btn1",
                child: Roulette(
                    animate: isOpened == true,
                    spins: 1,
                    infinite: false,
                    child: const Icon(Icons.settings,color: Colors.white,size: 20,)
                ),
              ),
          ],
        ),
            ):FloatingActionButton(
          onPressed: () {
            setState(() {
              isOpened = true;
            });
          },
          heroTag: "btn5",
          child: Roulette(
              animate: isOpened == false,
              spins: 1,
              infinite: false,
              child: const Icon(Icons.settings,color: Colors.white,size: 20)
          ),
        ),
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Text('sds')
          ],
        ),
      ),
    );
  }
}
