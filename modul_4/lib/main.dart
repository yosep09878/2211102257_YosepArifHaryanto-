import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final List<String> entries = const <String>['A', 'B', 'C'];
  final List<int> colorCodes = const <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Layout')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.amber[600],
                  width: 48.0,
                  height: 48.0,
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                children: <Widget>[
                  Container(width: 100, height: 100, color: Colors.red),
                  Container(width: 90, height: 90, color: Colors.green),
                  Container(width: 80, height: 80, color: Colors.blue),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                height: 250,
                child: Stack(
                  children: <Widget>[
                    Container(width: 250, height: 250, color: Colors.white),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.black.withAlpha(0),
                            Colors.black12,
                            Colors.black45,
                          ],
                        ),
                      ),
                      child: const Text(
                        'Foreground Text',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: const Text("He'd have you all unravel at the"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[200],
                    child: const Text('Heed not the rabble'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[300],
                    child: const Text('Sound of screams but the'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[400],
                    child: const Text('Who scream'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[500],
                    child: const Text('Revolution is coming...'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[600],
                    child: const Text('Revolution, they...'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListView.builder(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index]],
                    child: Center(
                      child: Text('Builder Entry ${entries[index]}'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ListView.separated(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index]],
                    child: Center(
                      child: Text('Separated Entry ${entries[index]}'),
                    ),
                  );
                },
                separatorBuilder:
                    (BuildContext context, int index) => const Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
