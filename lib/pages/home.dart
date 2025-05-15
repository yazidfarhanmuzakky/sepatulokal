import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sepatulokal/pages/menukatalog.dart';
import 'dart:io';
import 'package:sepatulokal/component/imagelist.dart';
import 'package:url_launcher/url_launcher.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 4000), (_) {
      _goToNextPage();
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void _goToNextPage() {
    if (_currentPageIndex < 7) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      _pageController.jumpToPage(0);
    }
  }

  void _goToPreviousPage() {
    if (_currentPageIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      _pageController.jumpToPage(7);
    }
  }

  void _sendMessageToWhatsApp() async {
    // Replace 'your_message_here' with the desired message you want to generate.
    String message = 'Hello, Saya Mau Order Sepatu!';

    // Replace 'phone_number' with the recipient's phone number, including the country code.
    String phoneNumber = '6289699830712';

    // Use the URL launcher package to send a message to WhatsApp.
    String url = 'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

    if (await canLaunch(url)) {
      await launch(
            url,
            universalLinksOnly: true,
            forceSafariVC: false,
            forceWebView: false,
            enableJavaScript: true,
      );
    } else {
      // Handle error: Unable to launch WhatsApp.
      print('Error: Could not launch WhatsApp.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Katalog Brand Sepatu Lokal'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 300,
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
                        stopTimer();
                        startTimer();
                      },
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPageIndex = index;
                          });
                        },
                        children: [
                          ImageList([
                            'lib/images/ventela/logoventela.jpeg',
                            'lib/images/compass/logocompass.png',
                            'lib/images/brodo/logobrodo.png',
                            'lib/images/gmx/logogmx.png',
                            'lib/images/word division/worddivisionlogo.jpg',
                            'lib/images/fyc/logofyc.png',
                            'lib/images/wakai/logowakai.png',
                            'lib/images/saint barkley/logosb.jpg',
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menukatalog(),
                    ),
                  ),
                  child: Text(
                    'Menu katalog',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Set the background color here
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: _sendMessageToWhatsApp,
                  child: Text(
                    'Order Disini',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Set the background color here
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Keluar dari aplikasi'),
                        content: Text('Apakah Anda yakin ingin keluar?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                              exit(0);
                            },
                            child: Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Exit'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
