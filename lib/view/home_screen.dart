import 'package:counter_app/providers/counter_provider.dart';
import 'package:counter_app/view/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  Consumer<CounterProvider>(
                    builder: (context, counterProvider, child) {
                      return Text(
                        counterProvider.count.toString(),
                        style: Theme.of(context).textTheme.displayLarge!
                            .copyWith(color: Colors.white, fontSize: 300),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyButton(
                    title: '-',
                    onPressed: () {
                      final counterProvider = Provider.of<CounterProvider>(
                        context,
                        listen: false,
                      );
                      if (counterProvider.count > 0) {
                        counterProvider.decrement();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'El contador no puede bajar de 0',
                              style: Theme.of(context).textTheme.displayLarge!
                                  .copyWith(color: Colors.black, fontSize: 30),
                            ),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                  ),
                  MyButton(
                    title: '+',
                    onPressed: () {
                      final counterProvider = Provider.of<CounterProvider>(
                        context,
                        listen: false,
                      );
                      if (counterProvider.count < 10) {
                        counterProvider.increment();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'El contador no puede subir de 10',
                              style: Theme.of(context).textTheme.displayLarge!
                                  .copyWith(color: Colors.black, fontSize: 30),
                            ),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
