import 'package:flutter/material.dart';
import '../data/demo_data.dart';
import '../widgets/photo_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final photos = DemoData.photos.where((p) => !p.isTrashed).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: photos.isEmpty
          ? const Center(child: Text('No photos yet'))
          : PhotoGrid(photos: photos),
    );
  }
}