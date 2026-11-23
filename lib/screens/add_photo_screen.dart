import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({super.key});

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;

  Future<void> pickPhoto() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  Future<void> SubmitImage() async {
    // Send to node backend
    print("Submit pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Photo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selectedImage == null)
              Column(
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
                ],
              )
            else
              Image.file(
                File(selectedImage!.path),
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: selectedImage == null ? pickPhoto : SubmitImage,
              label: Text(selectedImage == null ? "Add Photo" : "Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
