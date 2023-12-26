import 'package:contact_book/data%20model/contact.dart';
import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text(
          'Add Contacts',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //  TextField to take contact detail input
            TextField(
              controller: nameController,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Name:',
                labelStyle: const TextStyle(fontSize: 14),
              ),
            ),
            TextField(
              controller: phoneNumController,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Phone Number:',
                labelStyle: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final phoneNum = phoneNumController.text;
                final newContact = Contact(name: name, phoneNum: phoneNum);
                Navigator.pop(context, newContact);
              },
              child: const Text(
                'Add Contact',
                style: TextStyle(color: Colors.indigo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
