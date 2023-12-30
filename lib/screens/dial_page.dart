import 'package:contact_book/data_model/contact.dart';
import 'package:flutter/material.dart';

class DialPage extends StatefulWidget {
  const DialPage({super.key});

  @override
  State<DialPage> createState() => _DialPageState();
}

class _DialPageState extends State<DialPage> {
  static List<Contact> contacts = [
    const Contact(name: "John Doe", phoneNum: "1234567890"),
    const Contact(name: "Micheal Doe", phoneNum: "0987654321"),
    const Contact(name: "Bob Doe", phoneNum: "1234567890"),
    const Contact(name: "Robert Doe", phoneNum: "0987654321"),
    const Contact(name: "Alex Doe", phoneNum: "1234567890"),
    const Contact(name: "Jack Doe", phoneNum: "0987654321"),
    const Contact(name: "Jason Doe", phoneNum: "1234567890"),
    const Contact(name: "Patrick Doe", phoneNum: "0987654321"),
  ];

  List<Contact> displayList = List.from(contacts);

  void updateList(String value) {
    setState(() {
      displayList = contacts
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey,
        backgroundColor: Colors.green,
        elevation: 5,
        title: const Text(
          "Search Contacts",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  updateList(value);
                });
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.green,
                  hintText: "Enter Contact Name ",
                  hintStyle: TextStyle(color: Colors.black45),
                  prefixIcon: Icon(Icons.search)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: displayList.isEmpty
                  ? const Center(child: Text("No Contact Found!"))
                  : ListView.builder(
                      itemCount: displayList.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        title: Text(
                          displayList[index].name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Text(
                          displayList[index].phoneNum,
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
