class Person {
  String name;
  List<int> availability;

  Person({required this.name, List<int>? availability})
      : availability = availability ?? [];
}
