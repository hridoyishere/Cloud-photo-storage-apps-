import 'package:flutter/material.dart';
import '../data/demo_data.dart';
import '../models/photo_model.dart';

class AddPhotoScreen extends StatelessWidget {
  const AddPhotoScreen({super.key});

  // Demo: simulate adding a new photo
  void _addDemoPhoto(BuildContext context) {
    final newPhoto = Photo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      url: 'https://picsum.photos/seed/${DateTime.now().millisecondsSinceEpoch}/600/600',
      dateTaken: DateTime.now(),
      title: 'New Photo',
    );
    DemoData.photos.insert(0, newPhoto);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Photo added! Check Home tab.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Photo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_photo_alternate_outlined,
                size: 96, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'Add a new photo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pick from gallery or camera',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => _addDemoPhoto(context),
              icon: const Icon(Icons.add),
              label: const Text('Add Demo Photo'),
            ),
          ],
        ),
      ),
    );
  }
}