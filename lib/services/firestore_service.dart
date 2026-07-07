import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/project_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // This adds a new project to your database
  Future<void> addProject(Project project) async {
    await _db.collection('projects').add(project.toFirestore());
  }

  // This fetches all your projects from the database
  Stream<List<Project>> getProjects() {
    return _db.collection('projects').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Project.fromFirestore(doc.data(), doc.id);
      }).toList();
    });
  }
}
