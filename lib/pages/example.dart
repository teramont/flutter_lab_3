import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int val = 0;

  void increment() {
    setState(() {
      val++;
    });
  }

  void decrement() {
    setState(() {
      val--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Text('$val'),
          ),
        ),
        floatingActionButton: MyButtons(
          inc: increment,
          dec: decrement,
        ),
      ),
    );
  }
}

class MyButtons extends StatelessWidget {
  final Function inc, dec;

  MyButtons({this.inc, this.dec});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: inc,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: dec,
            child: Icon(Icons.indeterminate_check_box_outlined),
          )
        ],
      ),
    );
  }
}
