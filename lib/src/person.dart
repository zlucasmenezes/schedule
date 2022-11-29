class Person {
  String name;
  List<int> availability;
  List<String> roles;
  int priority;

  Person({
    required this.name,
    List<int>? availability,
    List<String>? roles,
    int? priority,
  })  : availability = availability ?? [],
        roles = roles ?? [],
        priority = priority ?? 0;
}
