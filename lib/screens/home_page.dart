import 'package:contact_book/screens/contact_page.dart';
import 'package:contact_book/screens/dial_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    builder: (context) => const DialPage(),
                  ),
                );
              },
              child: const Text(
                'Dial',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            ElevatedButton(
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
