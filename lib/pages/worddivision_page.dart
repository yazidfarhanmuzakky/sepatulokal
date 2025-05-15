import 'dart:async';
import 'package:flutter/material.dart';

class WorddivisionPage extends StatefulWidget {
  @override
  _WorddivisionPageState createState() => _WorddivisionPageState();
}

class _WorddivisionPageState extends State<WorddivisionPage> {
  final List<String> imageList1 = [
    'lib/images/word division/poisonwd.jpeg',
    'lib/images/word division/poisonwd2.jpeg',
    'lib/images/word division/poisonwd3.jpeg',
    'lib/images/word division/sizechartwd.jpeg',
  ];
  final List<String> imageList2 = [
    'lib/images/word division/midraw.jpeg',
    'lib/images/word division/midraw2.jpeg',
    'lib/images/word division/midraw3.jpeg',
    'lib/images/word division/sizechartwd.jpeg',
  ];
  final List<String> imageList3 = [
    'lib/images/word division/redflame.jpeg',
    'lib/images/word division/redflame2.jpeg',
    'lib/images/word division/redflame3.jpeg',
    'lib/images/word division/sizechartwd.jpeg',
  ];
  final List<String> imageList4 = [
    'lib/images/word division/clstattoo.jpeg',
    'lib/images/word division/clstattoo2.jpeg',
    'lib/images/word division/clstattoo3.jpeg',
    'lib/images/word division/sizechartwd.jpeg',
  ];
  final List<String> imageList5 = [
    'lib/images/word division/curve.jpeg',
    'lib/images/word division/curve2.jpeg',
    'lib/images/word division/curve3.jpeg',
    'lib/images/word division/sizechartwd.jpeg',
  ];
  // Add more image lists as needed

  final Color backgroundColor = Color(0xFF006400);

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
      _pageControllers[pageIndex]
          .jumpToPage(getImageList(pageIndex).length - 1);
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
        return '''• Tipe pengikat   : Tali
• Jenis kulit      : Suede
• Tampilan kulit  : Matte
• Tinggi sepatu   : Rendah
• Bahan               : Kanvas suede
• Model Sepatu   : Low sneakers''';
      case 1:
        return '''• Tipe pengikat    : Tali
• Jenis kulit       : Nubuck
• Tampilan kulit  : Matte
• Tinggi sepatu    : Medium
• Bahan                : Sintetis
• Model Sepatu    : Mid cut sneaker''';
      case 2:
        return '''• Tipe pengikat   : Tali
• Jenis kulit       : Suede
• Tampilan kulit  : Matte
• Tinggi sepatu   : Rendah
• Bahan               : Full suede leather
• Model Sepatu   : Low sneakers''';
      case 3:
        return '''• Tipe pengikat   : Tali
• Jenis kulit       : Suede
• Tampilan kulit  : Matte
• Tinggi sepatu   : Rendah
• Bahan               : Kanvas suede
• Model Sepatu   : Low sneakers''';
      case 4:
        return '''• Tipe pengikat   : Slip-on
• Tinggi sepatu    : Rendah
• Bahan               : Kulit''';
    // Add more descriptions for other image lists
      default:
        return '';
    }
  }

  final List<String> customNames = [
    '1. Classic Poison Black White\n(Rp 415.000,00)',
    '2. Midraw CH Black White\n(Rp 435.000,00)',
    '3. Classic Red Flames\n(Rp 425.000,00)',
    '4. Classic Tattoo Black White\n(Rp 415.000,00)',
    '5. Word Division Curve Slip On Black White\n(Rp 409.000,00)',
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
        title: Text('Word Division'),
        backgroundColor: Color(0xFF006400),
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
                      'lib/images/word division/worddivisionlogo.jpg',
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
                  final String description =
                  getImageListDescription(pageIndex);
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
                        width: 500,
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
