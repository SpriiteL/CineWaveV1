import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import 'appbarbottom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cinewave/firebase_options.dart';

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
      home: BottomBar(),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  Future<List<String>> getImageUrls() async {
    // List of image references
    final List<String> imageRefs = ['Nw6RhJkK_400x400.jpg', 'téléchargement.jpg', 'f4c53422-b80c-4672-bb76-624721ac2d20.jpg', 'Iqoo.png'];

    // Get download URLs for each image
    final List<String> imageUrls = [];
    for (var ref in imageRefs) {
      final url = await FirebaseStorage.instance.ref(ref).getDownloadURL();
      imageUrls.add(url);
    }

    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: getImageUrls(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // Display images with padding
            return Row(
              children: snapshot.data!.map((url) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: 
                    Image.network(url, fit: BoxFit.cover),
                  ),
                );
              }).toList(),
            );
          }
        }
      },
    );
  }
}