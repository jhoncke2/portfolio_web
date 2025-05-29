enum UserLkinkType{
  github,
  stackOverflow,
  linkedin
}

class UserSite{
  final UserLkinkType type;
  final String url;
  UserSite({
    required this.type,
    required this.url
  });
}