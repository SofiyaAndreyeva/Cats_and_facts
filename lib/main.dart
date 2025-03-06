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
        
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(100),
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
          )
        ),
      ),
    );
  }
}
