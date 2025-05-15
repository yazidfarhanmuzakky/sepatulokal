import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sepatulokal/pages/brodo_page.dart';
import 'package:sepatulokal/pages/compass_page.dart';
import 'package:sepatulokal/pages/fycfootwear_page.dart';
import 'package:sepatulokal/pages/saintbarkley.dart';
import 'package:sepatulokal/pages/ventela_page.dart';
import 'package:sepatulokal/pages/wakai_page.dart';
import 'package:sepatulokal/pages/geoffmax_page.dart';
import 'package:sepatulokal/pages/worddivision_page.dart';

class Menukatalog extends StatefulWidget {
  @override
  _MenukatalogState createState() => _MenukatalogState();
}

class _MenukatalogState extends State<Menukatalog> {
  List<String> menuItems = [
    'Compass',
    'Ventela',
    'Wakai',
    'Brodo',
    'Saint Barkley',
    'Geoff Max',
    'Word Division',
    'FYC Footwear',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Katalog Brand Sepatu Lokal'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(menuItems.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press here
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CompassPage(),
                              ),
                            );
                          } else if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VentelaPage(),
                              ),
                            );
                          } else if (index == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WakaiPage(),
                              ),
                            );
                          } else if (index == 3) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BrodoPage(),
                              ),
                            );
                          } else if (index == 4) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SainbarkleyPage(),
                              ),
                            );
                          } else if (index == 5) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GeoffmaxPage(),
                              ),
                            );
                          } else if (index == 6) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WorddivisionPage(),
                              ),
                            );
                          } else if (index == 7) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FycfootwearPage(),
                              ),
                            );
                          }
                        },
                        child: Text(menuItems[index]),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.black,
                          textStyle: TextStyle(fontSize: 16),
                          padding: EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// child: Container(
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(imagePaths[index]),
//                             fit: BoxFit.cover,
//                           ),
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),

// List<String> imagePaths = [
//     'lib/images/ventela/logoventela.jpeg',
//     'lib/images/compass/logocompass.png',
//     'lib/images/brodo/logobrodo.png',
//     'lib/images/gmx/logogmx.png',
//     'lib/images/word division/worddivisionlogo.jpg',
//     'lib/images/fyc/logofyc.png',
//     'lib/images/wakai/logowakai.png',
//     'lib/images/saint barkley/logosb.jpg',
//   ];

//   InkWell