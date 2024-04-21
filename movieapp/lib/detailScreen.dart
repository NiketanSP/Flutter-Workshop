// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  
  @override
  Widget build(BuildContext context) {
    Map<String, String> movie = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String url = movie["image_url"].toString();
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.deepPurple[100],
      ),
      
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //Image
              padding: EdgeInsets.all(10),
              height: 250,
              width: 500,
              child:ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                "https://image.tmdb.org/t/p/w500$url",
                fit: BoxFit.cover,),
              )
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(//TITLE
                movie['title'].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepPurple[900]
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(//Details
                  movie['overview'].toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}