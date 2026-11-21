import 'package:flutter/material.dart';
import '../data/demo_data.dart';
import '../widgets/photo_grid.dart';

class TrashScreen extends StatelessWidget {
  const TrashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trashed = DemoData.photos.where((p) => p.isTrashed).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Trash')),
      body: trashed.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete_outline, size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('Trash is empty'),
                ],
              ),
            )
          : PhotoGrid(photos: trashed),
    );
  }
}