import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashboardProvider>(context);

    

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 200, maxWidth: 300),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Color(0xFF19244E),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("All Projects", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
              const SizedBox(height: 12),
              for (var project in provider.projects)
                ListTile(
                  leading: const Icon(Icons.folder, color: Colors.white),
                  title: Text(project.title,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text("Project ${project.id} • See project details",
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
