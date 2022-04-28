class Person {
  String name;
  List<int> availability;
  List<String> roles;

  Person({
    required this.name,
    List<int>? availability,
    List<String>? roles,
  })  : availability = availability ?? [],
        roles = roles ?? [];
}
