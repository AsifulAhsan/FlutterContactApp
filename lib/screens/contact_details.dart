// ignore_for_file: prefer_const_constructors

import 'package:contact_book/data%20model/contact.dart';
import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  final Contact contact; // access contact var of Contact class
  const ContactDetails({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigoAccent,
        title: const Text(
          'Contact Details',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Container(
        margin: const EdgeInsetsDirectional.fromSTEB(50, 40, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.indigo,
                size: 40,
              ),
              title: Text(
                'Name: ${contact.name}',
                style: const TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.00),
              child: ListTile(
                leading: const Icon(
                  Icons.phone,
                  color: Colors.green,
                  size: 40,
                ),
                title: Text(
                  'Phone Number: ${contact.phoneNum}',
                  style: const TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            //add more details if neccessary
          ],
        ),
      ),
    );
  }
}
