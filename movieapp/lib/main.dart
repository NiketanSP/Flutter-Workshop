// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/detailScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      scrollBehavior: ScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      }),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> movies = [];

  void getMovies() async {
    final uri = Uri(
        host: "api.themoviedb.org",
        path: "/3/movie/now_playing",
        queryParameters: {
          "api_key": "39dea16e6f6339a64eb594cb1dfae383",
        });
    final res = await http.get(uri);
    final body = jsonDecode(res.body);
    print((body['results'] as List).length);
    final newMovies = body['results'] as List;
    for (int i = 0; i < newMovies.length; i++) {
      final movie = newMovies[i];
      Map<String, String> movieMap = {
        "title": movie['title'],
        "image_url": movie['backdrop_path'],
        "overview": movie['overview'],
        // "ratings": movie['vote_average']
        "release_date": movie['release_date']
      };

      movies.add(movieMap);
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          "Movie App",
          style: TextStyle(
              color: Colors.deepPurple[100], fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Now Playing",
              style: TextStyle(
                  color: Colors.deepPurple[900],
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            Container(
              height: 500,
              child: ListView.builder(
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Map<String, String> movie = movies[index];
                  String url = movie["image_url"].toString();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 300,
                        width: 200,
                        margin: EdgeInsets.all(5),
                        // decoration:
                        //     BoxDecoration(
                        //       color: Colors.deepPurple[200],
                        //     ),
                        child : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GestureDetector(
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500$url",
                            fit: BoxFit.cover,
                          ),
                          onTap: (){
                            Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => const MovieDetails(),
                            settings: RouteSettings(arguments: movie)));
                            },
                        ),
                        ),
                        
                      ),
                      Container(                
                        height: 40,
                        width: 200,
                        margin: EdgeInsets.all(5),
                        child: Text(
                          movie['title'].toString(),
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: Colors.deepPurple[900],
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
