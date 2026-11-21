import 'package:flutter/material.dart';
import 'package:photo_gallery_app/widgets/custom_bottom_nav_bar.dart';
import 'screens/add_photo_screen.dart';
import 'screens/home_screen.dart';
import 'screens/liked_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/trash_screen.dart';

void main() => runApp(const PhotoGalleryApp());

class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F9FC),
      ),
      home: const RootScreen(),
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _index = 0;

  // Order: Photos(0), Liked(1), Trash(2), Add(3), Profile(4)
  final _screens = const [
    HomeScreen(),
    LikedScreen(),
    TrashScreen(),
    AddPhotoScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // lets content flow behind the floating bar
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}