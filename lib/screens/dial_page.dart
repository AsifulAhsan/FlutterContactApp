import 'package:contact_book/data_model/contact.dart';
import 'package:flutter/material.dart';

class DialPage extends StatefulWidget {
  const DialPage({super.key});

  @override
  State<DialPage> createState() => _DialPageState();
}

class _DialPageState extends State<DialPage> {
  static List<Contact> contacts = [
    const Contact(name: 'John Doe', phoneNum: '123-456-7890'),
    const Contact(name: 'Jane Doe', phoneNum: '098-765-4321'),
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
                        title: Text(
                          displayList[index].name,
                        ),
                        subtitle: Text(
                          displayList[index].phoneNum,
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
