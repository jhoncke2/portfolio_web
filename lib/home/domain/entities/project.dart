enum LinkType{
  playstore,
  appstore,
  github
}

class ProjectLink{
  final LinkType type;
  final String url;
  ProjectLink({
    required this.type,
    required this.url
  });
}

class Project{
  final String name;
  final String shortDescription;
  final String longDescription;
  final String mainImage;
  final List<String> technologies;
  final List<ProjectLink> links;
  Project({
    required this.name,
    required this.shortDescription,
    required this.longDescription,
    required this.mainImage,
    required this.technologies,
    required this.links
  });
}