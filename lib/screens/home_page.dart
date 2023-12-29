// ignore_for_file: prefer_const_constructors

import 'package:contact_book/data_model/contact.dart';
import 'package:contact_book/screens/contact_page.dart';
import 'package:contact_book/screens/dial_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  final List<Contact> contacts = [
    const Contact(name: 'John Doe', phoneNum: '123-456-7890'),
    const Contact(name: 'Jane Doe', phoneNum: '098-765-4321'),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white10,
        child: const Center(
          child: Text(
            '[ CONTACT BOOK ]',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.indigoAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DialPage(contacts: contacts),
                  ),
                );
              },
              child: const Text(
                'Search',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactPage(),
                  ),
                );
              },
              child: const Text(
                'Contacts',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
