import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    String? imageUrl;
    String facts =
        'Click on the button and get a fact about the cat and a picture';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cats and Facts',
          style: TextStyle(fontFamily: 'Playwrite', fontSize: 30),
        ),
        backgroundColor: const Color.fromARGB(255, 243, 170, 194),
        toolbarHeight: 70,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
        padding:EdgeInsets.only( top: 400),
         child: Text(
          facts,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Playwrite', fontSize: 20, color: Colors.black, height: 1.3,
           ),
        ), 
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 50, left: 100,right: 100),
        child: SizedBox(
          width: 200,
          height: 50,
          child: OutlinedButton(
            onPressed: () {
              print('Нажата OutlinedButton');
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 243, 170, 194),
              side: const BorderSide(color: Colors.black, width: 1),
            ),
            child: const Text(
              'Get a cat',
              style: TextStyle(
                fontFamily: 'Playwrite',
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
