import 'package:portfolio_web/home/domain/entities/ability.dart';
import 'package:portfolio_web/home/domain/entities/project.dart';

class HomeInfo{
  final String profileUrl;
  final String presentation;
  final String cvUrl;
  final List<Ability> abilities;
  final List<Project> projects;
  HomeInfo({
    required this.profileUrl,
    required this.presentation,
    required this.cvUrl,
    required this.abilities,
    required this.projects
  });
}