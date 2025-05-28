enum AbilityType{
  mobile,
  backend,
  tool
}

class Ability{
  final String icon;
  final String name;
  final String? lvl;
  final AbilityType type;
  Ability({
    required this.icon,
    required this.name,
    required this.lvl,
    required this.type
  });
}