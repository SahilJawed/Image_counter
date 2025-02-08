import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ImageSwitcher(),
    );
  }
}

class ImageSwitcher extends StatefulWidget {
  const ImageSwitcher({super.key});

  @override
  State<ImageSwitcher> createState() => ImageSwitcherState();
}

class ImageSwitcherState extends State<ImageSwitcher> {
  int currimage = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    List<AssetImage> assetImages = [
      const AssetImage('images/image.jpeg'),
      const AssetImage('images/images.jpg')
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Switcher'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image(image: assetImages[currimage]),
            onTap: () {
              setState(() {
                currimage++;
                counter++;
                if (currimage == assetImages.length) {
                  currimage = 0; // Reset to 0 if it exceeds the list length
                }
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Tap Counter: $counter',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
