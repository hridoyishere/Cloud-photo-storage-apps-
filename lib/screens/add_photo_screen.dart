import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class Message {
  bool isSuccess;
  String message;
  Message({required this.isSuccess, required this.message});
}

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

  Message responseMessage = Message(isSuccess: false, message: "");
  bool isLoading = false;

  Future<void> SubmitImage() async {
    // Send to node backend
    try {
      setState(() {
        isLoading = true;
        responseMessage = Message(isSuccess: false, message: "");
      });
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://localhost:5000/api/upload'),
      );
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        selectedImage!.path,
      ));
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        // set message to success
        setState(() {
          responseMessage =
              Message(isSuccess: true, message: "Image uploaded successfully");
          selectedImage = null;
        });
      } else {
        print('Image upload failed with status: ${response.statusCode}');
        setState(() {
          responseMessage = Message(
              isSuccess: false,
              message:
                  "Image upload failed with status: ${response.statusCode}");
        });
      }
    } catch (e) {
      print("Error submitting image: $e");
      setState(() {
        responseMessage =
            Message(isSuccess: false, message: "Error submitting image: $e");
      });
    } finally {
      setState(() {
        isLoading = false;
      });
      // Clear the response message after 3 seconds
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          responseMessage = Message(isSuccess: false, message: "");
        });
      });
    }
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
              icon: isLoading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : (selectedImage == null
                      ? const Icon(Icons.add)
                      : const Icon(Icons.send)),
            ),
            // show response message
            if (responseMessage.message.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  responseMessage.message,
                  style: TextStyle(
                    color:
                        responseMessage.isSuccess ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
