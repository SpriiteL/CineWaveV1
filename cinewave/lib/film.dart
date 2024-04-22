import 'package:flutter/material.dart';
import 'appbar.dart';
import 'appbarbottom.dart';

class FilmPage extends StatelessWidget {
  const FilmPage({Key? key}) : super(key: key);

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
                  Text('Tarif', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
            SizedBox(height: 20),
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
                  Text('Contact', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
            SizedBox(height: 20), // Espacement avant le formulaire
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
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 5),
              Container(
                height: 1,
                width: 50,
                color: Colors.white,
              ),
              SizedBox(height: 5),
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
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text('Adresse Mail'),
          ),
          TextFormField(
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 154, 154, 154),
              filled: true,
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text('Message'),
          ),
          TextFormField(
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 154, 154, 154),
              filled: true,
            ),
            maxLines: 4,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Action à effectuer lors du clic sur le bouton Envoyer
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF002B53), // Background color
            ),
            child: Text('Envoyer', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
