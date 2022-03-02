import 'person.dart';

class Schedule {
  late Map<int, List<String>> _schedule;
  late List<int> _days;

  final List<Person> _people = [];
  final List<String> _roles;
  final int _month;
  final int _year;

  Schedule({
    List<String> roles = const ['Role 1', 'Role 2', 'Role 3', 'Role 4'],
    int? month,
    int? year,
  })  : _roles = roles,
        _month = month ?? DateTime.now().month,
        _year = year ?? DateTime.now().year {
    _days = _getDays(month: _month, year: _year);
    _schedule = {for (var day in _days) day: []};
  }

  List<Person> get people => _people;
  List<int> get days => _days;
  int get month => _month;
  int get year => _year;
  List<String> get roles => _roles;

  addPerson(Person person) {
    if (!person.availability.every((day) => _days.contains(day))) {
      print('Not all of available days of ${person.name} are on the schedule');
      person.availability =
          person.availability.where((day) => _days.contains(day)).toList();
    }

    int index = _people
        .indexWhere((p) => p.name.toLowerCase() == person.name.toLowerCase());
    if (index >= 0) {
      print('${person.name} has already been added. Updating available days.');
      _people[index].availability = person.availability;
      return;
    }

    _people.add(person);
  }

  List<int> _getDays({required int month, required int year}) {
    return [for (var i = 0; i < DateTime(year, month + 1, 0).day; i++) i]
        .where((day) => DateTime(year, month, day).weekday == DateTime.sunday)
        .toList();
  }
}
