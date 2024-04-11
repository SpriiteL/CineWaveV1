import 'package:cinewave/firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import 'appbarbottom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

import 'detailfilm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF002B53),
        hintColor: const Color(0xFF002B53),
        scaffoldBackgroundColor: const Color(0xFF001E3A),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: BottomBar(),
    );
  }
}

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  late final PageController _pageController;
  final int _numPages = 4; // Nombre total d'images dans la première rangée
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _numPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Future<List<List<String>>> getImageUrls() async {
    // List of image references for each row
    final List<List<String>> imageRefs = [
      // First row
      [
        'ACTION/1.jpg',
        'ACTION/2.jpg',
        'ACTION/3.jpg',
        'ACTION/4.jpg',
      ],
      // Second row
      [
        'HORROR/5.jpg',
        'HORROR/6.jpg',
        'HORROR/7.jpg',
        'HORROR/8.jpg',
      ],
      // Third row
      [
        'ENFANT/14.jpg',
        'ENFANT/15.jpg',
        'ENFANT/16.jpg',
        'ENFANT/17.jpg',
      ],
      // Fourth row
      [
        'BANNIERE/avatar2.jpeg',
        'BANNIERE/maxresdefault.jpg',
        'BANNIERE/ca.jpg',
        'BANNIERE/mowgli.jpeg',
      ],
    ];

    // Get download URLs for each image in each row
    List<List<String>> imageUrls = [];
    for (var row in imageRefs) {
      List<String> rowUrls = await _getImageUrlsFromRefs(row);
      imageUrls.add(rowUrls);
    }

    return imageUrls;
  }
  

  // Function to get image URLs from Firebase Storage references
  Future<List<String>> _getImageUrlsFromRefs(List<String> imageRefs) async {
    final List<String> imageUrls = [];
    for (var ref in imageRefs) {
      final url = await FirebaseStorage.instance.ref(ref).getDownloadURL();
      imageUrls.add(url);
    }
    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<List<String>>>(
      future: getImageUrls(),
      builder: (BuildContext context, AsyncSnapshot<List<List<String>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0),

                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FutureBuilder<Film>(
                                  future: getFilmDetails(['Avatar2', 'oppenheimer', 'ça', 'mowgli']).then((films) => films[index]),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.done) {
                                      if (snapshot.hasError) {
                                        return Text("Erreur : ${snapshot.error}");
                                      }
                                      return FilmDetailPage(film: snapshot.data!);
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.network(snapshot.data![3][index], fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                  ),
                  
                  const Text('ACTION',
                  style: TextStyle(
                      fontSize: 20, // Augmentez cette valeur pour augmenter la taille de la police
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: snapshot.data![0].asMap().entries.map((entry) {
                        var index = entry.key;
                        var url = entry.value;

                        return GestureDetector(
                          onTap: () {
                            // Ajoutez ici la navigation vers la page de détails du film
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FutureBuilder<Film>(
                                  future: getFilmDetails(['UnHommeEnColère', 'Avengers', 'TheMeg', 'Uncharted']).then((films) => films[index]),
 // Utilisez l'index pour obtenir l'ID du film correspondant
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.done) {
                                      if (snapshot.hasError) {
                                        return Text("Erreur : ${snapshot.error}");
                                      }
                                      return FilmDetailPage(film: snapshot.data!);
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.network(url, fit: BoxFit.cover, height: 150, width: 100),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text('HORREUR',
                  style: TextStyle(
                      fontSize: 20, // Augmentez cette valeur pour augmenter la taille de la police
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: snapshot.data![1].asMap().entries.map((entry) {
                        var index = entry.key;
                        var url = entry.value;

                        return GestureDetector(
                          onTap: () {
                            // Ajoutez ici la navigation vers la page de détails du film
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FutureBuilder<Film>(
                                  future: getFilmDetails(['us', 'proiedudiable', 'conjuring', 'nonne']).then((films) => films[index]),
 // Utilisez l'index pour obtenir l'ID du film correspondant
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.done) {
                                      if (snapshot.hasError) {
                                        return Text("Erreur : ${snapshot.error}");
                                      }
                                      return FilmDetailPage(film: snapshot.data!);
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.network(url, fit: BoxFit.cover, height: 150, width: 100),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text('FAMILLE',
                  style: TextStyle(
                      fontSize: 20, // Augmentez cette valeur pour augmenter la taille de la police
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: snapshot.data![2].asMap().entries.map((entry) {
                        var index = entry.key;
                        var url = entry.value;

                        return GestureDetector(
                          onTap: () {
                            // Ajoutez ici la navigation vers la page de détails du film
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FutureBuilder<Film>(
                                  future: getFilmDetails(['Naya', 'roilion', 'asterix', 'coco']).then((films) => films[index]),
 // Utilisez l'index pour obtenir l'ID du film correspondant
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.done) {
                                      if (snapshot.hasError) {
                                        return Text("Erreur : ${snapshot.error}");
                                      }
                                      return FilmDetailPage(film: snapshot.data!);
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.network(url, fit: BoxFit.cover, height: 150, width: 100),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            );
          }
        }
      },
    );
  }
}
