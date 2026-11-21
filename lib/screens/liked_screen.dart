import 'package:flutter/material.dart';
import '../data/demo_data.dart';
import '../widgets/photo_grid.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final liked = DemoData.photos
        .where((p) => p.isLiked && !p.isTrashed)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Liked')),
      body: liked.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('No liked photos yet'),
                ],
              ),
            )
          : PhotoGrid(photos: liked),
    );
  }
}