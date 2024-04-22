import 'package:flutter/material.dart';

class FilmPage extends StatelessWidget {
  const FilmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20.0),
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset('lib/assets/images/map.png'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      height: 1.0,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  const Text('Tarif', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      height: 1.0,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRectWithText('Basique', '10€'),
                _buildRectWithText('Réduit', '7,5€'),
                _buildRectWithText('-12 ans', '5€'),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      height: 1.0,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  const Text('Contact', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      height: 1.0,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Espacement avant le formulaire
            _buildContactForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildRectWithText(String text1, String text2) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
            color: const Color(0xFF002B53),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 5),
              Container(
                height: 1,
                width: 50,
                color: Colors.white,
              ),
              const SizedBox(height: 5),
              Text(
                text2,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Adresse Mail'),
          ),
          TextFormField(
            decoration: const InputDecoration(
              fillColor:  Color.fromARGB(255, 154, 154, 154),
              filled: true,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Message'),
          ),
          TextFormField(
            decoration: const InputDecoration(
              fillColor:  Color.fromARGB(255, 154, 154, 154),
              filled: true,
            ),
            maxLines: 4,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Action à effectuer lors du clic sur le bouton Envoyer
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF002B53), // Background color
            ),
            child: const Text('Envoyer', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
