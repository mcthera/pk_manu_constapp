class ProgressUpdate {
  final String id;
  final String projectId;
  final String updateText;
  final DateTime timestamp;

  ProgressUpdate({
    required this.id,
    required this.projectId,
    required this.updateText,
    required this.timestamp,
  });

  // Convert to Map for Firebase
  Map<String, dynamic> toMap() => {
    'projectId': projectId,
    'updateText': updateText,
    'timestamp': timestamp.toIso8601String(),
  };
}
