import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class RightPanel extends StatelessWidget {
  const RightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // fixed width for side panel
      color: const Color(0xFF1E1A3E), // dark background
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Working Hours
            const Text(
              "GENERAL 10:00 AM TO 7:00 PM",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),

            // Calendar
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2C2550),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime(2020),
                lastDay: DateTime(2030),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  leftChevronIcon:
                  Icon(Icons.chevron_left, color: Colors.white),
                  rightChevronIcon:
                  Icon(Icons.chevron_right, color: Colors.white),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: const TextStyle(color: Colors.white),
                  weekendTextStyle: const TextStyle(color: Colors.white70),
                  outsideTextStyle: const TextStyle(color: Colors.white24),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Today Birthday
            EventCard(
              title: "Today Birthday",
              avatars: const [
                "assets/images/icon.png",
                "assets/images/icon.png",
              ],
              totalCount: 2,
              buttonText: "Birthday Wishing",
              onPressed: () {
                debugPrint("Send Birthday Wishes 🎂");
              },
            ),

            // Anniversary Card
            EventCard(
              title: "Anniversary",
              avatars: const [
                "assets/avatar1.png",
                "assets/avatar2.png",
                "assets/avatar3.png",
              ],
              totalCount: 3,
              buttonText: "Anniversary Wishing",
              onPressed: () {
                debugPrint("Send Anniversary Wishes 💍");
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 Reusable EventCard
class EventCard extends StatelessWidget {
  final String title;
  final List<String> avatars;
  final int totalCount;
  final String buttonText;
  final VoidCallback onPressed;

  const EventCard({
    super.key,
    required this.title,
    required this.avatars,
    required this.totalCount,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2550),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: [
              const Text("✨", style: TextStyle(fontSize: 18,
                color: Colors.yellow,

              )),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text("✨", style: TextStyle(fontSize: 18,
                color: Colors.yellow,

              ),

              ),
            ],
          ),
          const SizedBox(height: 12),

          // Avatars with Image.asset inside CircleAvatar
          Row(
            children: [
              for (var avatar in avatars.take(3)) ...[
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white, // dark bg
                 child: ClipOval(
                    child: Image.asset('assets/images/icon.png'),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              if (avatars.length > 3)
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white24,
                  child: Text(
                    "+${avatars.length - 3}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),

          // Total Count
          Text(
            "Total   $totalCount",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 16),

          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onPressed,
              icon: const Icon(Icons.send, size: 16, color: Colors.white),
              label: Text(
                buttonText,
                style: const TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9B6DFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
