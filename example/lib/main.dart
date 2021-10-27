import 'package:flutter/material.dart';
import 'package:overlap_transition/overlap_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = OverlapTransitionController();

  @override
  Widget build(BuildContext context) {
    return OverlapTransition(
      duration: Duration(seconds: 1),
      curves: Curves.decelerate,
  
      overlapTransitionController: controller,
      primary: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () => controller.forward(),
            child: Text("Next"),
          ),
        ),
      ),
      secundary: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () => controller.reverse(),
            child: Text("Back"),
          ),
        ),
      ),
    );
  }
}
