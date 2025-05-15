import 'dart:async';
import 'package:flutter/material.dart';

class FycfootwearPage extends StatefulWidget {
  @override
  _FycfootwearPageState createState() => _FycfootwearPageState();
}

class _FycfootwearPageState extends State<FycfootwearPage> {
  final List<String> imageList1 = [
    'lib/images/fyc/slickfyc.jpeg',
    'lib/images/fyc/slickfyc2.jpeg',
    'lib/images/fyc/slickfyc3.jpeg',
    'lib/images/fyc/sizechartfyc.jpeg',
  ];
  final List<String> imageList2 = [
    'lib/images/fyc/dwarffyc.jpeg',
    'lib/images/fyc/dwarffyc2.jpeg',
    'lib/images/fyc/dwarffyc3.jpeg',
    'lib/images/fyc/sizechartfyc.jpeg',
  ];
  final List<String> imageList3 = [
    'lib/images/fyc/musafyc.jpeg',
    'lib/images/fyc/musafyc2.jpeg',
    'lib/images/fyc/musafyc3.jpeg',
    'lib/images/fyc/sizechartfyc.jpeg',
  ];
  final List<String> imageList4 = [
    'lib/images/fyc/csslimfyc.jpeg',
    'lib/images/fyc/csslimfyc2.jpeg',
    'lib/images/fyc/csslimfyc3.jpeg',
    'lib/images/fyc/sizechartfyc.jpeg',
  ];
  final List<String> imageList5 = [
    'lib/images/fyc/rookiefyc.jpeg',
    'lib/images/fyc/rookiefyc2.jpeg',
    'lib/images/fyc/rookiefyc3.jpeg',
    'lib/images/fyc/sizechartfyc.jpeg',
  ];

  final Color backgroundColor = Color(0xFFCC9900);

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
        return '''• Bagian atas kanvas 10oz buatan Indonesia.
• Outsole & midsole karet vulkanisir
• Sockliner EVA untuk kenyamanan tumit.
• Velcro strap system.''';
      case 1:
        return '''• Slip-on dengan tali sepatu yang bisa dilepas.
• Upper kanvas yang ringan dan nyaman.
• Outsole karet yang divulkanisir.
• EVA sock liner untuk kenyamanan dan perlindungan tumit.''';
      case 2:
        return '''• Upper berbahan kanvas yang ringan dan nyaman & super suede.
• Outsole karet yang divulkanisir.
• Sockliner EVA untuk kenyamanan tumit.
• Kulit sintetis di sekitar tumit.''';
      case 3:
        return '''• Bagian atas kanvas 10oz buatan Indonesia.
• Outsole & midsole karet vulkanisir.
• Metal finishes eyelets.
• Toe cap karet vulkanisir.
• Sockliner EVA untuk kenyamanan tumit.''';
      case 4:
        return '''• Upper     : Canvas – Black
• Midsole : Karet – True Black
• Stripe     : Screen Printed
• Warna    : Gunmetal''';
    // Add more descriptions for other image lists
      default:
        return '';
    }
  }

  final List<String> customNames = [
    '1. Slick Dwarf Black\n(Rp 325.000)',
    '2. Dwarf Broken White\n(Rp 365.000,00)',
    '3. Musac Black\n(Rp 395.000,00)',
    '4. CS Slim Tall Lui Black\n(Rp 299.000,00)',
    '5. Street Rookie - MK01 Low Cut - Gunmetal\n(Rp 399.000,00)',
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
        title: Text('FYC Footwear'),
        backgroundColor: Color(0xFFCC9900),
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
                      'lib/images/fyc/logofyc.png',
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
