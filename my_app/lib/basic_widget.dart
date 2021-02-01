import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My App',
      home: MyScaffold(),
    )
  );
}

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout
      child: Row(
        // <Widget> is the type of items in the list
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null),
          Expanded(child: title),
          IconButton(
              icon: Icon(Icons.search), 
              tooltip: 'Search', 
              onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    // Material is a conceptual piece of paper on which the UI appears
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example title', 
              // style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Hello, World!',
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}