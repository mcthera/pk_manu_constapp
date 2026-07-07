import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DailyProgressScreen extends StatelessWidget {
  const DailyProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daily Progress Updates")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('updates')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());

          var docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(docs[index]['updateText']),
              subtitle: Text(
                docs[index]['timestamp'].toString().substring(0, 16),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addUpdate(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addUpdate(BuildContext context) {
    // Simple logic to add an update
    FirebaseFirestore.instance.collection('updates').add({
      'updateText': 'Concrete poured at site',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }
}
