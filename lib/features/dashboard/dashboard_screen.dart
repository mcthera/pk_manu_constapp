import 'package:flutter/material.dart';
import 'project_list_screen.dart';
import 'add_project_screen.dart';
import 'detail_screen.dart';
import 'daily_progress_screen.dart'; // New Import

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "P.K. Construction Limited",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Company Homepage",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDashboardCard(
                    context,
                    Icons.analytics,
                    "Daily Progress",
                  ),
                  _buildDashboardCard(
                    context,
                    Icons.construction,
                    "Active Projects",
                  ),
                  _buildDashboardCard(context, Icons.people, "Team & Payroll"),
                  _buildDashboardCard(context, Icons.inventory, "Inventory"),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProjectScreen()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context,
    IconData icon,
    String title,
  ) {
    return InkWell(
      onTap: () {
        // Updated Navigation Logic
        if (title == "Daily Progress") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DailyProgressScreen(),
            ),
          );
        } else if (title == "Active Projects") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProjectListScreen()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen(title: title)),
          );
        }
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue[900]),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
