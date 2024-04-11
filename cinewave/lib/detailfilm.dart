import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<List<Film>> getFilmDetails(List<String> filmIds) async {
  List<Film> films = [];
  for (var filmId in filmIds) {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('films').doc(filmId).get();
    films.add(
      Film(
        title: doc['title'],
        description: doc['description'],
        imageUrl: doc['image_url'],
      ),
    );
  }
  return films;
}

class Film {
  final String title;
  final String description;
  final String imageUrl;

  Film({required this.title, required this.description, required this.imageUrl});
}

class FilmDetailPage extends StatelessWidget {
  final Film film;

  const FilmDetailPage({required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(film.imageUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                film.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                film.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
