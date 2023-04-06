import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
  List<Widget> data = List.generate(9, (index) {
    var value = (index + 1) * 100;
    return Container(
      height: 100,
      width: 100,
      color: Colors.green[value]!,
      // child: Text(index.toString()),
    );
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double width = constraints.constrainWidth();
            return width > 500
                ? SizedBox(
                    child: ListView.separated(
                      itemCount: data.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) => data[index],
                    ),
                  )
                : SizedBox(
                    height: 100,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              // crossAxisCount: 1,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1,
                              maxCrossAxisExtent: 100),
                      itemCount: data.length,
                      itemBuilder: (context, index) => data[index],
                    ));
          },
        ),
      ),
    );
  }
}
