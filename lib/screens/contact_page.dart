// ignore_for_file: prefer_const_constructors

import 'package:contact_book/data%20model/contact.dart';
import 'package:contact_book/screens/add_contact_screen.dart';
import 'package:contact_book/screens/contact_details.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final List<Contact> contacts = [
    const Contact(name: 'John Doe', phoneNum: '123-456-7890'),
    const Contact(name: 'Jane Doe', phoneNum: '098-765-4321'),
  ];

  Future<void> _navigateToAddContactScreen(BuildContext context) async {
    final newContact = await Navigator.push<Contact?>(
      context,
      MaterialPageRoute(
        builder: (context) => const AddContactScreen(),
      ),
    );
    if (newContact != null) {
      setState(() {
        contacts.add(newContact);
      });
    }
  }

  Future<void> _deleteConfirm(int index) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Delete Confirmation',
            style: TextStyle(fontSize: 18, color: Colors.redAccent),
          ),
          content: index == -1
              ? const Text('Are you sure you want to delete all contacts?')
              : const Text('Are you sure you want to delete this contact?'),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              onPressed: () {
                Navigator.of(context).pop(); //closes dialog
              },
            ),
            TextButton(
              child: const Text(
                'Delete',
                style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent),
              ),
              onPressed: () {
                if (index == -1) {
                  _deleteAllContact();
                } else {
                  _deleteContact(index); //deletes contact at index
                }
                Navigator.of(context).pop(); //closes dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteAllContact() {
    setState(() {
      contacts.clear(); //removes all contacts
    });
  }

  void _deleteContact(int index) {
    setState(() {
      contacts.removeAt(index); //removes contact at index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigoAccent,
        title: const Text(
          'Contacts',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          if (index < contacts.length) {
            final contact = contacts[index];
            return Card(
              color: Colors.white70,
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  child: Text(
                    contact.name.isNotEmpty ? contact.name[0] : '',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  contact.name,
                  style: const TextStyle(fontSize: 15),
                ),
                subtitle: Text(
                  contact.phoneNum,
                  style: const TextStyle(color: Colors.green),
                ),
                trailing: const Icon(Icons.arrow_forward_sharp),
                onLongPress: () {
                  _deleteConfirm(index);
                },
                onTap: () {
                  //navigate to contactDetails
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactDetails(
                        contact: contact,
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.indigoAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                //call func to navigate to AddContactScreen
                _navigateToAddContactScreen(context);
              },
              icon: const Icon(Icons.add, color: Colors.blue),
              label: const Text(
                'ADD',
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                _deleteConfirm(-1);
              },
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              label: const Text(
                'DELETE ALL',
                style: TextStyle(color: Colors.redAccent, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
