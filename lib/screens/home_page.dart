import 'package:contact_book/screens/contact_page.dart';
import 'package:contact_book/screens/dial_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey,
        backgroundColor: Colors.green,
        elevation: 5,
        title: const Text(
          'Home Page',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        leading: const Icon(Icons.home),
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
        elevation: 16,
        shadowColor: Colors.grey,
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(6),
                  shadowColor: MaterialStatePropertyAll(Colors.black)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DialPage(),
                  ),
                );
              },
              child: const Text(
                'Search',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(6),
                  shadowColor: MaterialStatePropertyAll(Colors.black)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactPage(),
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
