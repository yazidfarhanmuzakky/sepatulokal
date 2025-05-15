import 'dart:async';
import 'package:flutter/material.dart';

class BrodoPage extends StatefulWidget {
  @override
  _BrodoPageState createState() => _BrodoPageState();
}

class _BrodoPageState extends State<BrodoPage> {
  final List<String> imageList1 = [
    'lib/images/brodo/basesigbrodo.png',
    'lib/images/brodo/basesigbrodo2.jpeg',
    'lib/images/brodo/basesigbrodo3.jpeg',
    'lib/images/brodo/basesigbrodo4.jpeg',
    'lib/images/brodo/basesigukuran.jpeg',
  ];
  final List<String> imageList2 = [
    'lib/images/brodo/campobrodo.jpeg',
    'lib/images/brodo/campobrodo2.jpeg',
    'lib/images/brodo/campobrodo3.jpeg',
    'lib/images/brodo/campobrodo4.jpeg',
    'lib/images/brodo/campobrodosize.jpeg',
  ];
  final List<String> imageList3 = [
    'lib/images/brodo/vtgbrodo.jpeg',
    'lib/images/brodo/vtgbrodo2.jpeg',
    'lib/images/brodo/vtgbrodo3.jpeg',
    'lib/images/brodo/vtgbrodo4.jpeg',
    'lib/images/brodo/vtgbrodosize.jpeg',
  ];
  final List<String> imageList4 = [
    'lib/images/brodo/vulcanbrodo.jpeg',
    'lib/images/brodo/vulcanbrodo2.jpeg',
    'lib/images/brodo/vulcanbrodo3.jpeg',
    'lib/images/brodo/vulcanbrodo4.jpeg',
    'lib/images/brodo/vulcanbrodosize.jpeg',
  ];
  final List<String> imageList5 = [
    'lib/images/brodo/tondanobrodo.jpeg',
    'lib/images/brodo/tondanobrodo2.jpeg',
    'lib/images/brodo/tondanobrodo3.jpeg',
    'lib/images/brodo/tondanobrodo4.jpeg',
    'lib/images/brodo/tondanosize.jpeg',
  ];
  // Add more image lists as needed

  final Color backgroundColor = Color(0xFF00BFFF);

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
        return '''•	Bagian atas terbuat dari kulit imitasi baru
•	TPR PARANG sole
•	Bahan insole yang nyaman
•	Tali sepatu bulat poli
•	Alliance construction''';
      case 1:
        return '''•	Upper : PU Textured
•	Bagian belakang : Suede
•	Lidah sepatu : PU Textured
•	Tali sepatu : Flat Cotton
•	Lapisan : Visa terry
•	Insole : Multyfoam + Mesh + Poron
•	Outsole : Neo Court 2 (Rubber)''';
      case 2:
        return '''•	Upper : 12 Oz Cotton Canvas
•	Lapisan : Visa Tery ( Cotton lembut seperti bahan handuk)
•	Tali sepatu : Ivory Flat Cotton Lace dengan detail logo pada tip ujung tali
•	Insole : Cup Eva Insole
•	Outsole : Rubber Midsole Foxing Ivory & Rubber Ivory Outsole (Original Brodo Sole )
•	Pembuatan : Vulcanize Shoes
•	Lubang tali  : Flat eyelet dengan detail branding brood''';
      case 3:
        return '''•	Upper : Canvas
•	Tali sepatu : Flat Cotton
•	Lapisan : Canvas
•	Insole : Eva + Fabric
•	Outsole : Vulkanisir Karet
•	Lidah logo : Slip Anyaman
•	TPU logo on quarter''';
      case 4:
        return '''•	Upper: Berbahan mesh
•	Heel counter : semi suede
•	vamp : semi suede
•	Tongue : semi suede + Foam
•	Back tab : semi suede
•	Lining : multy spandex
•	Lace : flat cotton
•	Outsole : eva + rubber
•	Roosterbeak : PU
•	Binding : pu
•	Insole :Eva + Mesh
•	Detail tongue logo : print''';
    // Add more descriptions for other image lists
      default:
        return '';
    }
  }

  final List<String> customNames = [
    '1.	Base Signature Eco Black\n(Rp 399.000,00)',
    '2.	Campo Heritage Hi Full Black\n(Rp 428.000,00)',
    '3.	VTG V2 Hi Limestone Grey IS\n(Rp 429.000,00)',
    '4.	Vulcan Lo Khaki OWS\n(Rp 280.000,00)',
    '5.	Tondano Beak Beige Olive GS\n(Rp 368.000,00)',
    // Add more custom names for other image lists
  ];

  String getImageListName(int pageIndex) {
    // Return the corresponding custom name based on the pageIndex
    if (pageIndex >= 0 && pageIndex < customNames.length) {
      return customNames[pageIndex];
    }
    return '';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brodo'),
        backgroundColor: Color(0xFF00BFFF),
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
                      'lib/images/brodo/logobrodo.png',
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
