// Flutter Packages
import 'package:flutter/material.dart';

// My Packages
import 'package:hold_down_button/hold_down_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
      ),
      themeMode: ThemeMode.dark,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const Divider(
              thickness: 2,
            ),
            HoldDownButton(
              onHoldDown: _incrementCounter,
              child: const Text('Text'),
            ),
            const Divider(
              thickness: 2,
            ),
            HoldDownButton(
              onHoldDown: _incrementCounter,
              longWait: const Duration(milliseconds: 1000),
              middleWait: const Duration(milliseconds: 600),
              minWait: const Duration(milliseconds: 300),
              child: ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text('ElevatedButton'),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            HoldDownButton(
              onHoldDown: _incrementCounter,
              longWait: const Duration(milliseconds: 2000),
              middleWait: const Duration(milliseconds: 1500),
              minWait: const Duration(milliseconds: 1200),
              holdWait: const Duration(milliseconds: 1000),
              child: TextButton(
                onPressed: _incrementCounter,
                child: const Text('TextButton'),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            HoldDownButton(
              onHoldDown: _incrementCounter,
              longWait: const Duration(milliseconds: 100),
              middleWait: const Duration(milliseconds: 100),
              minWait: const Duration(milliseconds: 100),
              holdWait: const Duration(milliseconds: 100),
              child: InkWell(
                onTap: _incrementCounter,
                child: Ink(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text('Ink & InkWell'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: HoldDownButton(
        onHoldDown: _incrementCounter,
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
