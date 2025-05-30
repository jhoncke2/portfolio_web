import 'package:portfolio_web/home/domain/entities/ability.dart';
import 'package:portfolio_web/home/domain/entities/project.dart';
import 'package:portfolio_web/home/domain/entities/user_site.dart';

class HomeInfo{
  final String profileUrl;
  final List<String> jobInfo;
  final String cvUrl;
  final List<Ability> abilities;
  final List<Project> projects;
  final List<UserSite> sites;
  final String email;
  final String place;
  HomeInfo({
    required this.profileUrl,
    required this.jobInfo,
    required this.cvUrl,
    required this.abilities,
    required this.projects,
    required this.sites,
    required this.email,
    required this.place
  });
}