import 'package:flutter/material.dart';

class DialPage extends StatefulWidget {
  const DialPage({super.key});

  @override
  State<DialPage> createState() => _DialPageState();
}

class _DialPageState extends State<DialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey,
        elevation: 5,
        title: const Text(
          "Search Contacts",
          style: TextStyle(fontSize: 17),
        ),
      ),
      
    );
  }
}
