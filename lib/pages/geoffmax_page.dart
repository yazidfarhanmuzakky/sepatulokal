import 'dart:async';
import 'package:flutter/material.dart';

class GeoffmaxPage extends StatefulWidget {
  @override
  _GeoffmaxPageState createState() => _GeoffmaxPageState();
}

class _GeoffmaxPageState extends State<GeoffmaxPage> {
  final List<String> imageList1 = [
    'lib/images/gmx/timelessgmx.jpeg',
    'lib/images/gmx/timelessgmx2.jpeg',
    'lib/images/gmx/timelessgmx3.jpeg',
    'lib/images/gmx/sizechartgmx.jpeg',
  ];
  final List<String> imageList2 = [
    'lib/images/gmx/ethangmx.jpeg',
    'lib/images/gmx/ethangmx2.jpeg',
    'lib/images/gmx/ethangmx3.jpeg',
    'lib/images/gmx/sizechartgmx.jpeg',
  ];
  final List<String> imageList3 = [
    'lib/images/gmx/hfcourt.jpg',
    'lib/images/gmx/hfcourt2.jpg',
    'lib/images/gmx/hfcourt3.jpg',
    'lib/images/gmx/sizechartgmx.jpeg',
  ];
  final List<String> imageList4 = [
    'lib/images/gmx/dublin.jpg',
    'lib/images/gmx/dublin2.jpg',
    'lib/images/gmx/dublin3.jpg',
    'lib/images/gmx/sizechartgmx.jpeg',
  ];
  final List<String> imageList5 = [
    'lib/images/gmx/ironmaiden.jpg',
    'lib/images/gmx/ironmaiden2.jpg',
    'lib/images/gmx/ironmaiden3.jpg',
    'lib/images/gmx/sizechartgmx.jpeg',
  ];

  final Color backgroundColor = Color(0xFFDD6F00);

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
        return '''• Upper : Canvas
• Sole : Rubber
• Insole : Jersey Foam
• Teknik pembuatan : Vulcanize''';
      case 1:
        return '''• Upper : Canvas
• Sole : Rubber
• Insole : Jersey Foam
• Teknik pembuatan : Vulcanize''';
      case 2:
        return '''• Upper : Synthetic Suede
• Logo : Screen Print
• Quarter Logo : Synthetic Leather
• Outsole : Razor Grip
• Insole : Jersey Foam''';
      case 3:
        return '''• Upper : Canvas
• Outsole : Triangle
• Eyelets : Aluminum + ring''';
      case 4:
        return '''• Upper : Synthetic Leather
• Insole : Cup Insole
• Outsole : Honeycomb
• Foxing : Rubber
• Teknik pembuatan : Vulcanized''';
    // Add more descriptions for other image lists
      default:
        return '';
    }
  }

  final List<String> customNames = [
    '1. Timeless Low Black White STZ\n(Rp 345.000,00)',
    '2. Ethan Black White\n(Rp 345.000,00)',
    '3. Hf Court Brown White\n(Rp 345.000,00)',
    '4. Dublin Moss Crème\n(Rp 345.000,00)',
    '5. Geoff Max x Iron Maiden - Ethan Recon Iron Maiden\n(Rp 650.000,00)',
    // Add more custom names for other image lists
  ];

  String getImageListName(int pageIndex) {
    // Return the corresponding custom name based on the pageIndex
    if (pageIndex >= 0 && pageIndex < customNames.length) {
      return customNames[pageIndex];
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geoff Max'),
        backgroundColor: Color(0xFFDD6F00),
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
                      'lib/images/gmx/logogmx.png',
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
                                  onTap: () {
                                    _showLargeImageDialog(imageList[index]);
                                  },
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

  void _showLargeImageDialog(String imagePath) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath,
              height: 300,
              width: 300,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
