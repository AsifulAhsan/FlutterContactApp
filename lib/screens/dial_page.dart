// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, prefer_final_fields, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:contact_book/data_model/contact.dart';
import 'package:contact_book/screens/home_page.dart';
import 'package:flutter/material.dart';

class DialPage extends StatefulWidget {
  DialPage({Key? key, required this.contacts}) : super(key: key);
  final List<Contact> contacts;

  @override
  State<DialPage> createState() => _DialPageState();
}

class _DialPageState extends State<DialPage> {
  late List<Contact> filteredContacts;

  @override
  void initState() {
    super.initState();
    filteredContacts = List.from(widget.contacts);
  }

  void _searchContacts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredContacts = List.from(widget.contacts);
      } else {
        filteredContacts = widget.contacts
            .where((contact) =>
                contact.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 10,
        shadowColor: Colors.grey,
        backgroundColor: Colors.indigo,
        title:
            Text('SEARCH', style: TextStyle(color: Colors.white, fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextField(
                onChanged: _searchContacts,
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
              // SizedBox(height: 200),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     DialButton(number: '1'),
              //     DialButton(number: '2'),
              //     DialButton(number: '3'),
              //   ],
              // ),
              // SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     DialButton(number: '4'),
              //     DialButton(number: '5'),
              //     DialButton(number: '6'),
              //   ],
              // ),
              // SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     DialButton(number: '7'),
              //     DialButton(number: '8'),
              //     DialButton(number: '9'),
              //   ],
              // ),
              // SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     DialButton(number: '#'),
              //     DialButton(number: '0'),
              //     DialButton(number: '*'),
              //   ],
              // ),
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
        fixedSize: const Size(30, 40),
        elevation: 3,
      ),
      child: Text(
        number,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

void main(List<String> args) {
  runApp(HomePage());
}
