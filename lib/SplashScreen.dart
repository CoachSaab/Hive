import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gemini/home.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late BannerAd bannerAd;
  bool isAdLoaded = false;
  var adUnit = 'ca-app-pub-3940256099942544/2435281174';

  void initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: adUnit, // Use the test ad unit ID for testing
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Ad failed to load: $error');
        },
      ),
      request: AdRequest(),
    );

    bannerAd.load();
  }



  double _opacity = 0.0;
  String displayedText = "";
  final List<String> phrases = [
    "Inspire Change.......",
    "Innovate Continuously.......",
    "Empower Thought.......",
    "Transform Ideas.......",
    "Explore Possibilities.......",
    "Ignite Curiosity.......",
    "Embrace Learning.......",
    "Craft Connections.......",
    "Challenge Norms.......",
    "Elevate Minds.......",
    "Foster Understanding.......",
    "Expand Horizons.......",
    "Create Futures......."
  ];

  late String randomPhrase;

  @override
  void initState() {
    super.initState();
    initBannerAd();
    randomPhrase = phrases[Random().nextInt(phrases.length)];
    _startSplashScreen();
    _fadeIn();
    _startTypeWriterEffect();
  }

  void _startSplashScreen() {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  void _fadeIn() {
    Future.delayed(const Duration(milliseconds: 80), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  void _startTypeWriterEffect() {
    Timer.periodic(const Duration(milliseconds: 90), (timer) {
      if (displayedText.length < randomPhrase.length) {
        setState(() {
          displayedText += randomPhrase[displayedText.length];
        });
      } else {
        timer.cancel(); // Stop the timer when the full phrase is displayed
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('Assets/img_1.png'), // Your asset image
              ),
              const SizedBox(height: 20), // Space between image and text
              const Text(
                'HiVE CHat',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              Text(
                '$displayedText', // Display the progressively revealed text
                maxLines: 1, // Set to 1 for a single line
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey, // Ensure text color is visible
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: isAdLoaded
          ? SizedBox(
        height: bannerAd.size.height.toDouble(),
        width: bannerAd.size.width.toDouble(),
        child: AdWidget(ad: bannerAd),
      )
          : const SizedBox(),
    );
  }
  @override
  void dispose() {
    super.dispose();
    bannerAd.dispose(); // Dispose of the ad to prevent memory leaks
  }
}
