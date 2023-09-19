import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool get isEmpty => count == 0;

  bool get isFull => count == 20;

  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isFull ? 'Lotado ' : 'Pode Entrar!',
                style: TextStyle(fontSize: 30, color: Colors.black)),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('$count',
                  style: TextStyle(
                      fontSize: 100,
                      color: isFull ? Colors.red : Colors.black)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.blue.withOpacity(0.2) : Colors.blue,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Saiu',
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor:
                          isFull ? Colors.blue.withOpacity(0.2) : Colors.blue),
                  child: const Text('Entrou',
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
