// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, prefer_final_fields, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class DialPage extends StatefulWidget {
  DialPage({super.key});

  @override
  State<DialPage> createState() => _DialPageState();
}

class _DialPageState extends State<DialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 5,
        shadowColor: Colors.grey,
        backgroundColor: Colors.indigo,
        title: Text('SEARCH', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.indigo,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: "Search Contacts",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: 130),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DialButton(number: '1'),
                  DialButton(number: '2'),
                  DialButton(number: '3'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DialButton(number: '4'),
                  DialButton(number: '5'),
                  DialButton(number: '6'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DialButton(number: '7'),
                  DialButton(number: '8'),
                  DialButton(number: '9'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DialButton(number: '#'),
                  DialButton(number: '0'),
                  DialButton(number: '*'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DialButton extends StatelessWidget {
  final String number;
  const DialButton({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(60, 60),
        elevation: 3,
      ),
      child: Text(
        number,
        style: const TextStyle(fontSize: 26),
      ),
    );
  }
}

void main(List<String> args) {
  runApp(DialPage());
}
