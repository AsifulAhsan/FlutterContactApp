import 'package:flutter/material.dart';

class DialPage extends StatelessWidget {
  const DialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Dial',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 50, 10, 40),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
  runApp(const DialPage());
}
