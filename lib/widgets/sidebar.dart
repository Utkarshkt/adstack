import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final bool isCollapsed;
  final VoidCallback onToggle;

  const Sidebar({super.key, required this.isCollapsed, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isCollapsed ? 80 : 220,
      color: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              children: [

                SizedBox(height: 20),
                CircleAvatar(radius: 30, backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/user.png'),
                ),
                if (!isCollapsed) ...[
                  const SizedBox(height: 8),
                  const Text("Priyam Mishra",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text("Admin"),
                ]
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildTile(Icons.home, "Home"),
                _buildTile(Icons.people, "Employees"),
                _buildTile(Icons.check_circle, "Attendance"),
                _buildTile(Icons.summarize, "Summary"),
                _buildTile(Icons.info, "Information"),
                _buildTile(Icons.workspaces, "Workspaces"),
                _buildTile(Icons.settings, "Settings"),
                _buildTile(Icons.logout, "Logout"),
              ],
            ),
          ),
          IconButton(
            icon: Icon(isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios),
            onPressed: onToggle,
          ),
        ],
      ),
    );
  }
  Widget _buildTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: TextStyle(color: Colors.black87)),
      trailing: title == "Workspaces"
          ? Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,

        ),
        child: const Text(
          "+",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),
        ),
      )
          : null, // no trailing for other tiles
      onTap: () {
        print("$title tapped");
      },
    );
  }

}
