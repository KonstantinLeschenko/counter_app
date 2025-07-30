import 'package:counter_app/view/my_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/bg.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _counter.toString(),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Colors.white,
                      fontSize: 300,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyButton(title: '-', onPressed: _decrementCounter),
                  MyButton(title: '+', onPressed: _incrementCounter),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _incrementCounter() {
    if (_counter < 10) {
      setState(() {
        _counter++;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.amber[900],
          content: Text(
            'El contador no puede exceder 10',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.amber[900],
          content: Text(
            'El contador no puede bajar de 0',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }
}
