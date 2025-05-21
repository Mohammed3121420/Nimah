import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../auth/presentation/widgets/custom_input_decoration.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 85,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _submitMeal() {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedImage == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select an image')));
      return;
    }

    final mealData = {
      'name': _nameController.text.trim(),
      'description': _descriptionController.text.trim(),
      'price': double.parse(_priceController.text.trim()),
      'image': _selectedImage,
    };

    Navigator.pop(context, mealData);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Meal'),
        backgroundColor: Colors.orange[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: buildInputDecoration(
                  hint: 'Meal Name',
                  isPassword: false,
                  obscureText: false,
                  onToggle: () {},
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter meal name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: buildInputDecoration(
                  hint: 'Meal Description',
                  isPassword: false,
                  obscureText: false,
                  onToggle: () {},
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: buildInputDecoration(
                  hint: 'Meal Price',
                  isPassword: false,
                  obscureText: false,
                  onToggle: () {},
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter valid price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange[50],
                  ),
                  child:
                      _selectedImage != null
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              _selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          )
                          : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                                size: 50,
                                color: Colors.orange[300],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Tap to select meal image',
                                style: TextStyle(color: Colors.orange[700]),
                              ),
                            ],
                          ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitMeal,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[700],
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Save Meal',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
