import 'package:flutter/material.dart';
import 'package:madt_lab1/counter_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final String title;
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  HomePage({Key? key, required this.title}) : super(key: key);

  void _incrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context).getCounter;
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _notifier,
      builder: (_, mode, __) {
        return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: mode, // Decides which theme to show, light or dark.
            home: Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'The button was pushed this many times:',
                      ),
                      Text(
                        '$counter',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      ElevatedButton(
                        onPressed: () => _notifier.value =
                        mode == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light,
                        child: const Text('Change Theme'),
                      ),
                    ]),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => _incrementCounter(context),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ));
      },
    );
  }
}
