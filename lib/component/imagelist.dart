import 'package:flutter/material.dart';

class ImageList extends StatefulWidget {
  final List<String> imageList;

  ImageList(this.imageList);

  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPageIndex < widget.imageList.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      setState(() {
        _currentPageIndex += 1;
      });
    } else {
      // Reset back to the first image when reaching the end of the list
      _pageController.jumpToPage(0);
      setState(() {
        _currentPageIndex = 0;
      });
    }
  }

  void _goToPreviousPage() {
    if (_currentPageIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      setState(() {
        _currentPageIndex -= 1;
      });
    } else {
      _pageController.jumpToPage(widget.imageList.length - 1);
      setState(() {
        _currentPageIndex = widget.imageList.length - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > 0) {
                _goToPreviousPage();
              } else if (details.primaryVelocity! < 0) {
                _goToNextPage();
              }
            },
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showLargeImageDialog(widget.imageList[index]);
                  },
                  child: Image.asset(
                    widget.imageList[index],
                    fit: BoxFit.contain,
                  ),
                );
              },
              itemCount: widget.imageList.length,
            ),
          ),
          Positioned(
            left: 5,
            child: InkWell(
              onTap: _goToPreviousPage,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
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
            right: 5,
            child: InkWell(
              onTap: _goToNextPage,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
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
