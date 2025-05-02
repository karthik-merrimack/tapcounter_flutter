import 'dart:io' show exit;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const TapCounterApp());
}

class TapCounterApp extends StatelessWidget {
  const TapCounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap Counter App',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tapCount = 0;
  late final String _currentDateString;

  @override
  void initState() {
    super.initState();
    _currentDateString = DateFormat.yMMMMEEEEd().format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "You've tapped $_tapCount time${_tapCount == 1 ? '' : 's'}",
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2),
                ),
                onPressed: () {
                  setState(() {
                    _tapCount++;
                  });
                },
                child: const Text(
                  'Tap Me!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Welcome to the Tap Counter App!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                'Today is $_currentDateString',
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2),
                ),
                onPressed: () {
                  SystemNavigator.pop();
                  exit(0);
                },
                icon: const Icon(Icons.close, color: Colors.white),
                label: const Text(
                  'Close App',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
