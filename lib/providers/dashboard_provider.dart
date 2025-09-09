import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../models/creator_model.dart';
import '../models/person_model.dart';

class DashboardProvider extends ChangeNotifier {
  bool loading = true;
  List<ProjectModel> projects = [];
  List<CreatorModel> creators = [];

  // Dynamic lists
  List<PersonModel> birthdays = [];
  List<PersonModel> anniversaries = [];

  DashboardProvider() {
    loadDashboardData();
  }

  Future<void> loadDashboardData() async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    projects = [
      ProjectModel("Technology behind Blockchain", "#1"),
      ProjectModel("AI in Fintech", "#2"),
      ProjectModel("Flutter for Web", "#3"),
    ];

    creators = [
      CreatorModel("maddison_c1", 9821,4),
      CreatorModel("kart_will002", 7032,4),
      CreatorModel("alexa_dev", 9021 ,4),
    ];

    birthdays = [
      PersonModel("Ravi Kumar", "🎂"),
      PersonModel("Sneha Singh", "🎂"),
    ];

    anniversaries = [
      PersonModel("John & Mary", "💍"),
      PersonModel("Alex & Sara", "💍"),
      PersonModel("Priya & Arjun", "💍"),
    ];

    loading = false;
    notifyListeners();
  }

  void addBirthday(String name) {
    birthdays.add(PersonModel(name, "🎂"));
    notifyListeners();
  }

  void addAnniversary(String name) {
    anniversaries.add(PersonModel(name, "💍"));
    notifyListeners();
  }
}
