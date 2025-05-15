import 'dart:async';
import 'package:flutter/material.dart';

class CompassPage extends StatefulWidget {
  @override
  _CompassPageState createState() => _CompassPageState();
}

class _CompassPageState extends State<CompassPage> {
  final List<String> imageList1 = [
    'lib/images/compass/gazellelowcreamdepan.jpg',
    'lib/images/compass/gazellelowcream.png',
    'lib/images/compass/sizechartgazellelowcream.png',
  ];
  final List<String> imageList2 = [
    'lib/images/compass/lowcreamretro.png',
    'lib/images/compass/lowcreamretrobelakang.jpg',
    'lib/images/compass/lowcreamretrosamping.jpg',
    'lib/images/compass/sizechartgazellelowcream.png',
  ];
  final List<String> imageList3 = [
    'lib/images/compass/gazellelowcreamdepan.jpg',
    'lib/images/compass/gazellelowcream.png',
    'lib/images/compass/sizechartgazellelowcream.png',
  ];
  final List<String> imageList4 = [
    'lib/images/compass/gazellelowcreamdepan.jpg',
    'lib/images/compass/gazellelowcream.png',
    'lib/images/compass/sizechartgazellelowcream.png',
  ];
  final List<String> imageList5 = [
    'lib/images/compass/gazellelowcreamdepan.jpg',
    'lib/images/compass/gazellelowcream.png',
    'lib/images/compass/sizechartgazellelowcream.png',
  ];
  // Add more image lists as needed

  final Color backgroundColor = Color(0xFF800000);

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
        return '''• Model sepatu rendah
• Bagian atas terbuat dari kanvas 12 oz
• Lapisan atas terbuat dari kanvas 6oz
• Logo sidetrim terbuat dari bahan PVC
• Silver eyelets
• Tali sepatu berbahan poliester
• Label anyaman yang disesuaikan
• Outsole berbahan karet
• Proses vulkanisasi
• Made in Indonesia''';
      case 1:
        return '''•	Model sepatu rendah
•	Bagian atas terbuat dari kanvas 12 oz
•	Lapisan atas terbuat dari bahan Dri-fit
•	Logo sidetrim terbuat dari bahan PVC
•	Silver eyelets
•	Tali sepatu berbahan katun
•	Bantalan kerah busa di sekitar pergelangan kaki
•	Detail timbul pada backtab tumit
•	Lidah sepatu terbuat dari nilon dengan busa
•	Outsole berbahan karet
•	Proses vulkanisasi
•	Made in Indonesia''';
      case 2:
        return '''•	Model sepatu tinggi
•	Bagian atas terbuat dari kanvas 12 oz
•	Lapisan atas terbuat dari bahan mesh
•	Logo sidetrim terbuat dari bahan PVC
•	Silver eyelets
•	Tali sepatu berbahan katun
•	Bantalan kerah busa di sekitar pergelangan kaki
•	Detail timbul pada backtab tumit
•	Lidah sepatu terbuat dari nilon dengan busa
•	Outsole berbahan karet
•	Proses vulkanisasi
•	Made in Indonesia
    ''';
      case 3:
        return '''•	Model sepatu rendah
    •	Bagian atas terbuat dari kanvas 12 oz
    •	Lapisan atas terbuat dari bahan PVC
    •	Detail timbul pada backtab tumit
•	Outsole berbahan karet
    •	Proses vulkanisasi
•	Made in Indonesia
    ''';
      case 4:
        return '''•	Model sepatu rendah
•	Bagian atas terbuat dari kanvas.
•	Insole terbuat dari kanvas
•	Logo sidetrim terbuat dari bahan PVC metalik
•	Label anyaman yang dibuat khusus
•	Gold eyelets
•	Tali sepatu terbuat dari katun ukuran besar
•	Karet foxing
•	Outsole berbahan karet
•	Proses vulkanisasi
•	Made in Indonesia
    ''';
    // Add more descriptions for other image lists
      default:
        return '';
    }
  }

  final List<String> customNames = [
    '1.	Gazelle Low Cream\n(Rp 408.000,00)',
    '2.	Retrograde Low Cream\n(Rp 538.000,00)',
    '3.	Retrograde Hi Decon Black White',
    '4.	Retrograde Slip On Black',
    '5.	Proto Lite Green',
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
        title: Text('Compass'),
        backgroundColor: Color.fromARGB(255, 199, 199, 199),
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
                      'lib/images/compass/logocompass.png',
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
