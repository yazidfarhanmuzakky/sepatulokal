import 'dart:async';
import 'package:flutter/material.dart';

class SainbarkleyPage extends StatefulWidget {
  @override
  _SainbarkleyPageState createState() => _SainbarkleyPageState();
}

class _SainbarkleyPageState extends State<SainbarkleyPage> {
  final List<String> imageList1 = [
    'lib/images/saint barkley/cullensb.jpg',
    'lib/images/saint barkley/cullensb2.jpg',
    'lib/images/saint barkley/cullensb3.jpg',
    'lib/images/saint barkley/sizechartsb.jpeg',
  ];
  final List<String> imageList2 = [
    'lib/images/saint barkley/buckheavensb.jpeg',
    'lib/images/saint barkley/buckheavensb2.jpeg',
    'lib/images/saint barkley/buckheavensb3.jpeg',
    'lib/images/saint barkley/sizechartsb.jpeg',
  ];
  final List<String> imageList3 = [
    'lib/images/saint barkley/newbroxsb.jpeg',
    'lib/images/saint barkley/newbroxsb2.jpeg',
    'lib/images/saint barkley/newbroxsb3.jpeg',
    'lib/images/saint barkley/sizechartsb.jpeg',
  ];
  final List<String> imageList4 = [
    'lib/images/saint barkley/midlothian.jpeg',
    'lib/images/saint barkley/midlothian2.jpeg',
    'lib/images/saint barkley/sizechartsb.jpeg',
  ];
  final List<String> imageList5 = [
    'lib/images/saint barkley/hamilton.jpeg',
    'lib/images/saint barkley/hamilton2.jpeg',
    'lib/images/saint barkley/hamilton3.jpeg',
    'lib/images/saint barkley/hamilton4.jpeg',
    'lib/images/saint barkley/sizechartsb.jpeg',
  ];
  // Add more image lists as needed

  final Color backgroundColor = Color(0xFF008000);
  //0xFF00BFFF

  final List<PageController> _pageControllers = List<PageController>.generate(
    5,
        (_) => PageController(),
  );

  final List<int> _currentPageIndices = List<int>.filled(5, 0);

  @override
  void dispose() {
    for (var pageController in _pageControllers) {
      pageController.dispose();
    }
    super.dispose();
  }

  void _goToNextPage(int pageIndex) {
    if (_currentPageIndices[pageIndex] < getImageList(pageIndex).length - 1) {
      _pageControllers[pageIndex].nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      setState(() {
        _currentPageIndices[pageIndex] += 1;
      });
    } else {
      // Reset back to the first image when reaching the end of the list
      _pageControllers[pageIndex].jumpToPage(0);
      setState(() {
        _currentPageIndices[pageIndex] = 0;
      });
    }
  }


  void _goToPreviousPage(int pageIndex) {
    if (_currentPageIndices[pageIndex] > 0) {
      _pageControllers[pageIndex].previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      _pageControllers[pageIndex].jumpToPage(getImageList(pageIndex).length - 1);
    }
  }

  List<String> getImageList(int pageIndex) {
    // Return the corresponding image list based on the pageIndex
    switch (pageIndex) {
      case 0:
        return imageList1;
      case 1:
        return imageList2;
      case 2:
        return imageList3;
      case 3:
        return imageList4;
      case 4:
        return imageList5;
    // Add more cases for other image lists
      default:
        return [];
    }
  }

  String getImageListDescription(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return '''•	Full canvas material
•	Slip on
•	Outsole berbahan karet
•	Warna hitam''';
      case 1:
        return '''•	Berbahan super suede dan canvas
•	Tali sepatu berbahan poliester
•	Outsole berbahan karet
•	Warna hitam''';
      case 2:
        return '''•	Berbahan super suede dan canvas
•	Tali sepatu berbahan poliester
•	Outsole berbahan karet
•	Warna putih''';
      case 3:
        return '''•	Hi-top sneakers dengan desain hitam putih
•	Warna hitam
•	Upper kanvas dan suede
•	Insole tekstil
•	Rubber outsole
•	Detail tali depan
•	Round toe''';
      case 4:
        return '''•	Berbahan canvas
•	Tali sepatu berbahan poliester
•	Outsole berbahan karet
•	Warna hitam''';
    // Add more descriptions for other image lists
      default:
        return '';
    }
  }

  final List<String> customNames = [
    '1.	Burgerkill x Saint Barkley – Cullen Slip On\n(RP 625.000,00)',
    '2.	Buckheaven Leo Black On Black\n(RP 432.000,00)',
    '3.	New Broxburn White Tosca\n(RP 432.000,00)',
    '4.	Midlothian\n(RP 450.000,00)',
    '5.	Hamilton Classic Black\n(RP 450.000,00)',
    // Add more custom names for other image lists
  ];

  String getImageListName(int pageIndex) {
    // Return the corresponding custom name based on the pageIndex
    if (pageIndex >= 0 && pageIndex < customNames.length) {
      return customNames[pageIndex];
    }
    return '';
  }

  void _showLargeImageDialog(String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saint Barkley'),
        backgroundColor: Color(0xFF008000),
      ),
      body: Container(
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 16),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'lib/images/saint barkley/logosb.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Divider(
                  color: Colors.white,
                  height: 2,
                ),
                ...List.generate(5, (pageIndex) {
                  final String imageListName = getImageListName(pageIndex);
                  final String description = getImageListDescription(pageIndex);
                  return Column(
                    children: [
                      SizedBox(height: 16),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            imageListName.isNotEmpty
                                ? imageListName
                                : 'Image List ${pageIndex + 1}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            PageView.builder(
                              controller: _pageControllers[pageIndex],
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPageIndices[pageIndex] = index;
                                });
                              },
                              itemBuilder: (context, index) {
                                final imageList = getImageList(pageIndex);
                                return GestureDetector(
                                  onTap: () =>
                                      _showLargeImageDialog(imageList[index]),
                                  child: Image.asset(
                                    imageList[index],
                                    fit: BoxFit.contain,
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              left: 20,
                              child: InkWell(
                                onTap: () => _goToPreviousPage(pageIndex),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF8B0000),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 20,
                              child: InkWell(
                                onTap: () => _goToNextPage(pageIndex),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF8B0000),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        width:500,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 16),
                      Divider(
                        color: Colors.white,
                        height: 2,
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
