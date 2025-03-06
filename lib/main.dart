import 'package:cats_and_facts/requests/facts_requests.dart';
import 'package:flutter/material.dart';
import 'package:cats_and_facts/requests/image_requests.dart';

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
  final ImageRequests imageRequests = ImageRequests();
  final FactsRequests factsRequests = FactsRequests();

  String? _imageUrl;
  String? _facts = 'After clicking on the button you will receive a fact and a picture of the cat';
  bool loading = false;

  // Метод для загрузки картинки и текста
  Future<void> resourceExtraction() async {
    setState(() {
      loading = true;
    });

    final imageUrl = await imageRequests.getImage();
    final facts = await factsRequests.getFact();

    setState(() {
      _imageUrl = imageUrl;
      _facts = facts;
      loading = false;
    });
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color.fromARGB(255, 44, 47, 81),
                  width: 5,
                ),
              ),

              child:
                  loading
                      ? Transform.scale(
                        scale: 0.5, 
                        child: CircularProgressIndicator(color: Color.fromARGB(255, 44, 47, 81)),
                      )
                      : _imageUrl == null
                      ? const Text(
                        ' ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                          fontFamily: 'PlayWrite',
                        ),
                      )
                      : Image.network(
                        _imageUrl!,
                        height: 350,
                        width: 350,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                _facts! ?? "No facts available",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PlayWrite',
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 40, left: 100, right: 100),
        child: SizedBox(
          width: 200,
          height: 50,
          child: OutlinedButton(
            onPressed: () {
              resourceExtraction();
              print('Нажата OutlinedButton');
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 243, 170, 194),
              side: const BorderSide(
                color: Color.fromARGB(255, 44, 47, 81),
                width: 3,
              ),
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
