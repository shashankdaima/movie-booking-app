import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/gradiant_button.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Search(),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Movies",
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600, fontSize: 26),
            ),
          ),
          for (int i = 0; i < 10; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: MovieOverview2(),
            ),
        ],
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF2F2C44),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for Movies, Genre, Theater'),
          ),
        ),
      ),
    );
  }
}

class MovieOverview2 extends StatelessWidget {
  const MovieOverview2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "assets/images/sample_poster.webp",
              width: 150,
              height: 210,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Avenger's Endgame",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600, fontSize: 24),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text("4.5/5"),
                GradiantButton(
                  onPressed: () {
                    
                  },
                  height: 32,
                  borderRadius: BorderRadius.circular(10),
                  child: Text("Book This"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
