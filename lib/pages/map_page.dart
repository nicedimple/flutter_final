import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map Page')),
      body: Center(
        child:
            Text('Map will be displayed here', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
