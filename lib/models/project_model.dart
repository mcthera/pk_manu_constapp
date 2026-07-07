class Project {
  final String id;
  final String name;
  final String location;
  final String status; // e.g., 'In Progress', 'Completed'

  Project({
    required this.id,
    required this.name,
    required this.location,
    required this.status,
  });

  // This method converts Firestore data into a Project object
  factory Project.fromFirestore(Map<String, dynamic> data, String documentId) {
    return Project(
      id: documentId,
      name: data['name'] ?? 'Unknown Project',
      location: data['location'] ?? 'No Location',
      status: data['status'] ?? 'Pending',
    );
  }

  // This method prepares the object to be saved to Firestore
  Map<String, dynamic> toFirestore() {
    return {'name': name, 'location': location, 'status': status};
  }
}
