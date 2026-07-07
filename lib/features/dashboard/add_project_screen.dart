import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import '../../models/project_model.dart';

class AddProjectScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final FirestoreService _service = FirestoreService();

  AddProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Project")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Project Name"),
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: "Location"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final newProject = Project(
                  id: '',
                  name: _nameController.text,
                  location: _locationController.text,
                  status: 'In Progress',
                );
                await _service.addProject(newProject);
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text("Save Project"),
            ),
          ],
        ),
      ),
    );
  }
}
