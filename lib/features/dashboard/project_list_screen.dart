import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import '../../models/project_model.dart';

class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirestoreService service = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Active Projects"),
        backgroundColor: Colors.blue[900],
      ),
      body: StreamBuilder<List<Project>>(
        stream: service.getProjects(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No active projects found."));
          }

          final projects = snapshot.data!;
          return ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: const Icon(Icons.business, color: Colors.blueAccent),
                  title: Text(project.name),
                  subtitle: Text("${project.location} • ${project.status}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
